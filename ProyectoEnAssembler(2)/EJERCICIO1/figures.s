.ifndef figures_s
.equ figures_s, 0x00000000

.include "data.s"
.include "utils.s"

/*
    @brief: 
    draw a rectangule in the frame bufferSecundario with the color in x24
    address base (x3, x4) in lower left corner.
			
    @param: x3, x4: coordinates of the pixel to map
    @param: x5: height of the rectangule 
    @param: x8: width of the rectangule
    @param: w24: color of the square
    @save_stack: x3, x4, x6, x7, x30 
*/	

draw_rectangule:
    sub sp, sp, #40
    str x7, [sp, #32]
    str x6, [sp, #24]
    str x4, [sp, #16]
    str x3, [sp, #8]
    str x30, [sp]
	
    bl map
    mov x6, x5		  	// height
draw_rectangule_loop1:
    mov x7, x8     		// width
draw_rectangule_loop2:
    stur w24, [x0]
    add x0, x0, #4
    sub x7, x7, #1 
    cbnz x7, draw_rectangule_loop2 
    sub x4, x4, #1
    bl map 
    sub x6, x6, #1 
    cbnz x6, draw_rectangule_loop1 
	
    ldr x7, [sp, #32]
    ldr x6, [sp, #24]
    ldr x4, [sp, #16]
    ldr x3, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #40
    br x30


/* pintarCirculo
    Parámetros:
        x0 = Dirección base del arreglo
        w18 = Color
        x3 = Coordenada del centro en x
        x4 = Coordenada del centro en y
        x5 = Radio

    Utiliza x8, x21, x22, x23, x24, x25, x26 
    y los registros utilizados por pintarPixel (x9).
    No modifica ningún parámetro.
 */
/* Funciona recorriendo el cuadrado mínimo que contiene al círculo, 
   y en cada pixel decidiendo si pintar o no.
   La forma usual de saber si un punto (x, y) está en el circulo centrado
   en (x1, y1) de radio r es
  ver si la norma de la distancia entre el punto y el centro es menor que r.
  En formulas:
    ||(x, y) - (x1, y1)|| <= r
    Aplicando la definición de norma:
        sqrt((x - x1)^2 + (y - y1)^2) <= r
    Esto es equivalente a:
        (x - x1)^2 + (y - y1)^2 <= r^2

    Para hacer menos cálculos uso esta última formula.
 */
pintarCirculo:
    // Guardo el puntero de retorno en el stack
    sub sp, sp, #8
    stur lr, [sp]
        
    // Guardo en x25 la condenada del centro en x
    mov x25, x3
        
    // Guardo en x26 la condenada del centro en y
    mov x26, x4
        
    // Guardo en x8 la posición final en x
    add x8, x3, x5
        
    // Guardo en x21 la posición final en y
    add x21, x4, x5
        
    // x22 = r^2 // para comparaciones en el loop
    mul x22, x5, x5
        
    // Pongo en x3 la posición inicial en x
    sub x3, x3, x5 

// loop para avanzar en x
loop0_pintarCirculo:
    cmp x3, x8
    b.gt end_loop0_pintarCirculo
    sub x4, x21, x5
        
    // Pongo en x4 la posición inicial en y
    sub x4, x4, x5

// loop para avanzar en y
loop1_pintarCirculo: 
    cmp x4, x21
    // Veo si tengo que pintar el pixel actual
    b.gt end_loop1_pintarCirculo
        
    // x23 = distancia en x desde el pixel actual al centro
    sub x23, x3, x25
        
    // x23 = w23 * w23 
    // Si los valores iniciales estaban en el rango permitido,
    // x23 = w23 (sumll es producto signado)
    smull x23, w23, w23
        
    // x24 = distancia en y desde el pixel actual al centro
    sub x24, x4, x26
        
    // x23 = x24*x24 + x23
    // x23 = cuadrado de la distancia entre el centro y el pixel actual
    smaddl x23, w24, w24, x23
    cmp x23, x22
    b.gt fi_pintarCirculo
        
    // Pinto el pixel actual
    bl map 
    stur w18, [x0]

fi_pintarCirculo:
    add x4, x4, #1
    b loop1_pintarCirculo

end_loop1_pintarCirculo:
    add x3, x3, #1
    b loop0_pintarCirculo

end_loop0_pintarCirculo:
        
    // Restauro en x3 la condenada del centro en x
    mov x3, x25
        
    // Restauro en x4 la condenada del centro en y
    mov x4, x26
        
    // Recupero el puntero de retorno del stack
    ldur lr, [sp] 
    add sp, sp, #8 
        
    // return
    br lr 

.endif
