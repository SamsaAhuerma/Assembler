.ifndef utils_s
.equ utils_s, 0

.include "data.s"

/*
  La funcion module_x computa el resto de la division
  entre x3 y 640 usando la formula mod(a, b) = a -b*(a/b)  
  donde (a/b) es la division piso

  - Input: x3 <- Eje x 
  - Registros temporales x1 y x5
  - Output: x3 := mod(x3, 640)
*/

module_x:
    sub sp, sp, #24
    str x5, [sp, #16]
    str x1, [sp, #8]
    str x30, [sp]

    mov x1, #640
    add x3, x3, x1
    udiv x5, x3, x1
    msub x3, x5, x1, x3
    bl end_module_x

end_module_x:
    ldr x5, [sp, #16]
    ldr x1, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #24
    br x30

/*
  La funcion module_y computa el resto de la division
  entre x4 y 480 usando la formula mod(a, b) = a -b*(a/b)  
  donde (a/b) es la division piso

  - Input: x4 <- Eje y 
  - Registros temporales x1 y x5
  - Output: x4 := mod(x4, 480)
*/

module_y:
    sub sp, sp, #24
    str x5, [sp, #16]
    str x1, [sp, #8]
    str x30, [sp]

    mov x1, #480
    add x4, x4, x1            
    udiv x5, x4, x1           
    msub x4, x5, x1, x4        
    bl end_module_y

end_module_y:
    ldr x5, [sp, #16]
    ldr x1, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #24
    br x30

/*
  El proc map pone en x0 la dir de memoria del px (x, y).
  Antes de hacer el mapeo, calcula el mod(x3, 640) y 
  mod(x4, 480) por medio de las fun module_x y module_y 
  respectivamente, esto define el arreglo como una matriz 
  Toroidal 

  - Inputs (x3, x4)
  - Usa y modifica los registros x21 y x15
  - No modifica x3 y x4
  - Output x0 apunta al px (x3, x4) del main FrameBuffer
  - Usa module_x, module_y
  @saveStack: x21, x26, x30 
*/

map:
    sub sp, sp, #24 
    str x26, [sp, #16]
    str x21, [sp, #8] 
    str x30, [sp]

//    bl module_x
//    bl module_y

    mov x21, #4               
    ldr x0, =bufferSecundario
//	mov x0, x20
    mov x26, 2560              
    madd x0, x26, x4, x0 	    
    madd x0, x21, x3, x0     
    
    ldr x26, [sp, #16]
    ldr x21, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #24 
    br x30

/* 
  El proc doDelay hace un gran loop para crear delay, 
  el tiempo de delay depende de la constante delay.
  
  - Input: delay <- La constante delay se define en datos.s
  - Usa sin salvar el registro x9
*/

doDelay:
    ldr x19, delay
loop_doDelay:
    subs x19, x19, 1
    b.ne loop_doDelay    
    br x30 

/*
	@brief: draws ALL framebuffer with a color (blue) bluecolorbg2

	@param:	none

	@return: none

	@saveStack: x1, x2, x30

    @color: w24
*/

draw_bg:
    sub sp, sp, #24 
    str x4, [sp, #16]
    str x3, [sp, #8]
    str x30, [sp]

    ldr w24, blue1_color
	ldr x0, =bufferSecundario
//	mov x0, x20
	mov x2, SCREEN_HEIGH    // Y Size
draw_bg_loop1:
	mov x1, SCREEN_WIDTH    // X Size
draw_bg_loop0:
	stur w24, [x0]  			// Colorear el pixel N
	add x0, x0, #4    			// Siguiente pixel
	sub x1, x1, #1    			// Decrementar contador X
	cbnz x1, draw_bg_loop0  // Si no terminó la fila, salto
	sub x2, x2, #1    			// Decrementar contador Y
	cbnz x2, draw_bg_loop1  // Si no es la última fila, salto	
	
    ldr x4, [sp, #16]
    ldr x3, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #24 
    br x30 


.endif
