.include "functions.s"


.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32



.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
// Gracias por este proyecto divertido, excelentes profes los 4

Fondo:
    mov x5, SCREEN_WIDTH

	mov x10, 0
	mov x2, SCREEN_HEIGH         // Y Size Y = 480
loop1:
	mov x1, SCREEN_WIDTH         // X Size x = 640
loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter 
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump


DegradadoEspacial:  
    ldr s1, =0x00000001
    ldr s0, =0x00000000
    fmov s10, s0
    mov x3, 0// eje x
    mov x4, 410 // eje y
    mov x6, x5 // largo
    mov x9, x6 
    mov x2,  80 // alto cuadrado
    add x2, x2, x4

DegrPos:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintDegr:
    stur s10,[x0]         
    add x0,x0,4              
    sub x6,x6,1    
    cbnz x6, PaintDegr 
    cmp x4, x2        
    b.eq Letras
    
DegrReset:
    add x4, x4, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    fadd s10, s10, s1
    mov x6, x9
    b PaintDegr 




Letras:
    movz x10, 0x04, lsl 16
    movk x10, 0xC718, lsl 00   
    mov x0, x20  // posicion base    
    mov x1, xzr // indice de cuad          
L:  mov x3, 6 // eje x
    mov x4, 6 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 6 // eje x
    mov x4, 17 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal

I:  mov x3, 24 // eje x
    mov x4, 6 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 20 // eje x
    mov x4, 6 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 20 // eje x
    mov x4, 17 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
V:
    mov x3, 34 // eje x
    mov x4, 6 // eje y
    mov x2, 7 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 41 // eje x
    mov x4, 6 // eje y
    mov x2, 7 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 35 // eje x
    mov x4, 14 // eje y
    mov x6, 3 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 39 // eje x
    mov x4, 14 // eje y
    mov x6, 3 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 37 // eje x
    mov x4, 16 // eje y
    mov x6, 3 // largo linea
    mov x9, x6
    bl LineaHorizontal
E:
    mov x3, 48 // eje x
    mov x4, 6 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 48 // eje x
    mov x4, 6 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 48 // eje x
    mov x4, 17 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 48 // eje x
    mov x4, 11 // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
      
S: 
    mov x3, 62 // eje x
    mov x4, 6  // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 61 // eje x
    mov x4, 7 // eje y
    mov x2, 3 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 62 // eje x
    mov x4, 11  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 70 // eje x
    mov x4, 12 // eje y
    mov x2, 4 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 62   // eje x
    mov x4, 17  // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
    
Play: 

    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x3, 80 // eje x 80
    mov x4, 14 // eje y
    mov x6, 17 // largo
    mov x9, x6 
    mov x2, 5// alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 83 // eje x  83
    mov x4, 10 // eje y
    mov x6, 11 // largo
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 87 // eje x 85
    mov x4, 7 // eje y
    mov x6, 3 // largo
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
Play2:
    mov x3, 100 // eje x 80
    mov x4, 14 // eje y
    mov x6, 17 // largo
    mov x9, x6 
    mov x2, 5// alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 103 // eje x  83
    mov x4, 10 // eje y
    mov x6, 11 // largo
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 107 // eje x 85
    mov x4, 7 // eje y
    mov x6, 3 // largo
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Score:
S2: 
    mov x3, 502 // eje x 202
    mov x4, 6  // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 501 // eje x  201
    mov x4, 7 // eje y
    mov x2, 3 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 502 // eje x  202
    mov x4, 11  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 510 // eje x
    mov x4, 12 // eje y
    mov x2, 4 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 502   // eje x
    mov x4, 17  // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
C:
    mov x3, 518   // eje x
    mov x4, 6  // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal 
    mov x3, 517 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 518   // eje x
    mov x4, 17  // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal 

o:
    mov x3, 533   // eje x
    mov x4, 6  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 532 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 533   // eje x
    mov x4, 17  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 540 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical

R:
    mov x3, 547 // eje x
    mov x4, 6 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 547   // eje x
    mov x4, 6  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 547   // eje x
    mov x4, 12   // eje y
    mov x6, 8  // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 555 // eje x
    mov x4, 8 // eje y
    mov x2, 3 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 555 // eje x
    mov x4, 14 // eje y
    mov x2, 4  // largo linea
    add x2, x2, x4  
    bl LineaVertical
E2:
    mov x3, 560 // eje x
    mov x4, 6 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 560 // eje x
    mov x4, 6 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 560 // eje x
    mov x4, 17 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 560 // eje x
    mov x4, 11 // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
2:

    mov x3, 580   // eje x
    mov x4, 17  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 586
    mov x4, 10
    mov x14, 7
    mov x15, x14
    bl LineaDiagonalIzq

    mov x3, 586 // eje x
    mov x4, 7 // eje y
    mov x2, 3 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 581   // eje x
    mov x4, 6  // eje y
    mov x6, 5 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 579 // eje x
    mov x4, 7 // eje y
    mov x2, 3 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    
02:    
    mov x3, 595   // eje x
    mov x4, 6  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 594 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 596   // eje x
    mov x4, 17  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 603 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 603
    mov x4, 8
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    
    
    
    
/////////////////////FIN DE FONDO///////////////////////

    mov x21, 11 // repeticion de sprite
    mov x24, 0 // y + x14 para bajar y unidades y repetir
    mov x19, 0
    mov x22, 3 // ESCALAR, cantidad de pixeles por unidad (1 = 3 pixeles juntos)
    mov x23, 2 // repeticion de filas
    

Marciano_numero1:

HeadArgs:
    movz x10, 0xFFFF, lsl 00     // color CELESTE   
    mov x0, x20  // posicion base    
    mov x1, xzr // indice de cuad          
    mov x3, 48 // eje x
    add x3, x3, x19
    mov x4, 54 // eje y
    add x4, x4, x24
    mov x5, SCREEN_WIDTH //640
    mov x6, 21 //  largo cuad
    mov x9, x6
    mov x2, 12 // alto cuadrado
    add x2, x2, x4  
    bl Cuadraditos

Eyes:
    mov x10, 0// color negro             
    mov x3, 51 // eje x
    add x3, x3, x19
    mov x4, 57 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
           
    mov x3, 63 // eje x
    add x3, x3, x19
    mov x4, 57 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

antenas:
	movz x10, 0xFFFF, lsl 00 // color CELESTE         
    mov x3, 51 // eje x  
    add x3, x3, x19
    mov x4, 51 // eje y
    add x4, x4, x24
    mov x6, 3  //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
                
    mov x3, 63 // eje x
    add x3, x3, x19
    mov x4, 51 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
        
    mov x3, 48 // eje x
    add x3, x3, x19
    mov x4, 48 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
         
    mov x3, 66 // eje x
    add x3, x3, x19
    mov x4, 48 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

MarcianitoArms:
    mov x3, 45 // eje x
    add x3, x3, x19
    mov x4, 57 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 69 // eje x
    add x3, x3, x19
    mov x4, 57 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 42 // eje x
    add x3, x3, x19
    mov x4, 60 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 9 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 72 // eje x
    add x3, x3, x19
    mov x4, 60 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 9 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    
Mouth:
    mov x3, 48 // eje x
    add x3, x3, x19
    mov x4, 66 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 66 // eje x
    add x3, x3, x19
    mov x4, 66 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    
    mov x3, 51 // eje x
    add x3, x3, x19
    mov x4, 69 // eje y
    add x4, x4, x24
    mov x6, 6 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 60 // eje x
    add x3, x3, x19
    mov x4, 69 // eje y
    add x4, x4, x24
    mov x6, 6 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


Fila: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, Marciano_numero1
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, Marciano_numero1 


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2


Marciano_numero2:

HeadArgs2:
    movz x10, 0xDD00, lsl 00 // color Verde
    mov x3, 54
    add x3, x3, x19
    mov x4, 90  
    add x4, x4, x24
    mov x6, 9 // longitud de vertice
    mov x9, x6  // x9 = 6
    mov x2, 15 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 4 
    mov x15, x14
    bl Triangulito
    
    mov x3, 42 // eje x
    add x3, x3, x19
    mov x4, 105 // eje y
    add x4, x4, x24
    mov x6, 33  //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x4, 108 // eje y
    add x4, x4, x24
    mov x6, 33  //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Eyes2:
    movz x10, 0
    mov x3, 51 // eje x
    add x3, x3, x19
    mov x4, 105 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 63 // eje x
    add x3, x3, x19
    mov x4, 105 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


Tentacles:
    movz x10, 0xDD00, lsl 00
    mov x3, 51 // eje x
    add x3, x3, x19
    mov x4, 111 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 48 // eje x
    add x3, x3, x19
    mov x4, 114 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 63 // eje x
    add x3, x3, x19
    mov x4, 111 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 66 // eje x
    add x3, x3, x19
    mov x4, 114 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
     
    mov x3, 54 // eje x
    add x3, x3, x19
    mov x4, 114 // eje y
    add x4, x4, x24
    mov x6, 9 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 51 // eje x
    add x3, x3, x19
    mov x4, 117 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 63 // eje x
    add x3, x3, x19
    mov x4, 117 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 45 // eje x
    add x3, x3, x19
    mov x4, 117 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 69 // eje x
    add x3, x3, x19
    mov x4, 117 // eje y
    add x4, x4, x24
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Fila2: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, Marciano_numero2 
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, Marciano_numero2 

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

Marciano_numero3:


HeadArgs3:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 00
    mov x3, 51
    add x3, x3, x19
    mov x4, 93 
    add x4, x4, x24
    mov x6, 17 // longitud de vertice
    mov x9, x6
    mov x2, 14 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 5 
    mov x15, x14
    bl Triangulito2
    mov x3, 35 // eje x
    add x3, x3, x19
    mov x4, 108 // eje y
    add x4, x4, x24
    mov x6, 47 //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 42 // eje x
    add x3, x3, x19
    mov x4, 96 // eje y
    add x4, x4, x24
    mov x6, 34  //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
Eyes3:
    movz x10, 0
    mov x3, 46 // eje x
    add x3, x3, x19
    mov x4, 108 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 64 // eje x
    add x3, x3, x19
    mov x4, 108 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Tentacles2:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 0
    mov x3, 46 // eje x
    add x3, x3, x19
    mov x4, 114 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 64 // eje x
    add x3, x3, x19
    mov x4, 114 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 41 // eje x
    add x3, x3, x19
    mov x4, 119 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 55 // eje x
    add x3, x3, x19
    mov x4, 119 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 69 // eje x
    add x3, x3, x19
    mov x4, 119 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 33 // eje x
    add x3, x3, x19
    mov x4, 123 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 77 // eje x
    add x3, x3, x19
    mov x4, 123 // eje y
    add x4, x4, x24
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
Fila3: 
    add x19, x19, 70  // DISTANCIA ENTRE CADA REPETICION DE SPRITE
    sub x21, x21, 1
    cbnz x21, Marciano_numero3 

mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2




Player: 

    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 270 // eje x
    mov x4, 460 // eje y
    mov x6, 50 // largo
    mov x9, x6 
    mov x2,  11// alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 275 // eje x
    mov x4, 455 // eje y
    mov x6, 40 // largo
    mov x9, x6 
    mov x2,  10 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 291 // eje x
    mov x4, 448 // eje y
    mov x6, 8 // largo
    mov x9, x6 
    mov x2,  10 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



Coberturas:


    movz x10, 0xFF, lsl 16
    mov x3, 70
    add x3, x3, x19
    mov x4, 365  
    mov x6, 30 // longitud de vertice
    mov x9, x6  // x9 = 6
    mov x2, 7 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 2 
    mov x15, x14
    bl Triangulito
    mov x3, 55 // eje x
    add x3, x3, x19
    mov x4, 373 // eje y
    mov x6, 60 // largo
    mov x9, x6 
    mov x2,  30 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    movz x10, 0, lsl 16 // color negro
    mov x3, 77
    add x3, x3, x19
    mov x4, 393  
    mov x6, 15 // longitud de vertice
    mov x9, x6  // x9 = 6
    mov x2, 5 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 2 
    mov x15, x14
    bl Triangulito
    mov x3, 69 // eje x
    add x3, x3, x19
    mov x4, 398 // eje y
    mov x6, 31 // largo
    mov x9, x6 
    mov x2,  15 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
FilaBarriers: 
    add x19, x19, 150
    sub x21, x21, 1
    cbnz x21, Coberturas

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

DisparosPlayer:
    
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 294 // eje x
    mov x4, 400 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    

DisparosMarcianos:
    mov x3, 174
    mov x4, 350  
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 179
    mov x4, 355  
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 175
    mov x4, 360  
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalDer

MarcianitoMuerto:
    

Explosion:

    mov x10, 0
    mov x3, 380 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 55 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    
    mov x3, 410 // eje x
    mov x4, 240 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 410 // eje xw
    mov x4, 261 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 397 // eje x
    mov x4, 255 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 415 // eje x
    mov x4, 255 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 397
    mov x4, 242  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 423
    mov x4, 242  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 404
    mov x4, 261  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 416
    mov x4, 261  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer
    mov x10, 0
    mov x3, 100 // eje x
    mov x4, 243 // eje y
    mov x6, 55 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    



    

	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop
