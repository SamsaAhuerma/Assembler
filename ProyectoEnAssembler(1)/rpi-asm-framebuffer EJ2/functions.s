
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480


Cuadraditos:  
 

CuadPos:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintCuad:
    stur w10,[x0]          //aplica  color en pantalla 
    add x0,x0,4     // siguiente pixel
    sub x6,x6,1    // decrementa el contador de ancho
    cbnz x6, PaintCuad // asegura que el largo se completo
    cmp x4, x2        // altura cuadrado  PRE: x4< literal
    b.eq return
    
CuadReset:
    add x4, x4, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, x9
    b PaintCuad

return:

br x30

Triangulito:



TriangPos:
    madd x1, x4, x5, x3  // indexacion de arreglo unidimensional
    lsl x1, x1, 2
    add x0, x20, x1

PaintTriang:
    stur w10, [x0]
    add x0, x0, 4  // siguiente pixel
    sub x6, x6, 1   // resto al contador
    cbnz x6, PaintTriang    // pinto hasta que el contador sea 0
    cmp x4, x2  // comparo el eje y con el largo final
    b.eq return
    
TriangReset:
    add x4, x4, 1
    madd x1, x4, x5, x3  
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, x9
    sub x14, x14, 1
    cbnz x14, PaintTriang
    mov x14, x15
    
    sub x3, x3, 4
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    add x9, x9, 8  // x9+8 x9= 14
    mov x6, x9      // 
    b PaintTriang


Triangulito2:



TriangPos2:
    madd x1, x4, x5, x3  // indexacion de arreglo unidimensional
    lsl x1, x1, 2
    add x0, x20, x1

PaintTriang2:
    stur w10, [x0]
    add x0, x0, 4  // siguiente pixel
    sub x6, x6, 1   // resto al contador
    cbnz x6, PaintTriang2    // pinto hasta que el contador sea 0
    cmp x4, x2  // comparo el eje y con el largo final
    b.eq return
    
TriangReset2:
    add x4, x4, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, x9
    sub x14, x14, 1
    cbnz x14, PaintTriang2
    mov x14, x15
    
    sub x3, x3, 8
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    add x9, x9, 15
    mov x6, x9
    b PaintTriang2

LineaVertical:
    mov x6, 2
LinePosV:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintLineV:
    stur w10,[x0]          //aplica  color en pantalla 
    add x0,x0,4     // siguiente pixel
    sub x6,x6,1    // decrementa el contador de ancho
    cbnz x6, PaintLineV // asegura que el largo se completo
    cmp x4, x2        // altura cuadrado  PRE: x4< literal
    b.eq return
    
LineResetV:
    add x4, x4, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, 2
    b PaintLineV

LineaHorizontal:


    mov x2, 1 // largo linea
    add x2, x2, x4 
LinePosH:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintLineH:
    stur w10,[x0]          //aplica  color en pantalla 
    add x0,x0,4     // siguiente pixel
    sub x6,x6,1    // decrementa el contador de ancho
    cbnz x6, PaintLineH // asegura que el largo se completo
    cmp x4, x2        // altura cuadrado  PRE: x4< literal
    b.eq return

LineResetH:
    add x4, x4, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, x9
    b PaintLineH

LineaDiagonalDer:
   
   mov x6, 2
LinePosDiagD:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintLineDiagD:
    stur w10,[x0]         
    add x0,x0,4    
    sub x6,x6,1  
    cbnz x6, PaintLineDiagD
    cmp x4, 2       
    b.eq return
    
LineResetDiagD:
    add x4, x4, 1
    add x3, x3, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, 2
    sub x14, x14, 1
    cbnz x14, PaintLineDiagD
    mov x14, x15
    b return

LineaDiagonalIzq:
   
   mov x6, 2
LinePosDiagI:
    madd x1, x4, x5, x3
    lsl x1, x1, 2   
    add x0, x20, x1     

PaintLineDiagI:
    stur w10,[x0]         
    add x0,x0,4    
    sub x6,x6,1  
    cbnz x6, PaintLineDiagI
    cmp x4, 2       
    b.eq return
    
LineResetDiagI:
    add x4, x4, 1
    sub x3, x3, 1
    madd x1, x4, x5, x3
    lsl x1, x1, 2
    add x0, x20, x1
    mov x6, 2
    sub x14, x14, 1
    cbnz x14, PaintLineDiagI
    mov x14, x15
    b return


Fondo:

     sub sp,sp, #16 
    str x30,[sp,#8] 
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
0:
    mov x3, 580   // eje x
    mov x4, 6  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 578 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 580   // eje x
    mov x4, 17  // eje y
    mov x6, 8 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 588 // eje x
    mov x4, 8 // eje y
    mov x2, 8 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 587
    mov x4, 8
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    
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

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  
br x30


Marciano_numero1:
        sub sp,sp, #16 
        
        str x30,[sp,#8] 
           
  

HeadArgs:
    movz x10, 0xFFFF, lsl 00     // color Celeste  
    mov x0, x20  // posicion base    
    mov x1, xzr // indice de cuad          
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7 // x mas desplazamiento por frame
    mov x4, 18 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8  // y mas desplazamiento por frame
    mov x5, 640 //640
    mov x6, 7 //  largo cuad
    mul x6, x6, x22
    mov x9, x6
    mov x2, 4 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4  
    bl Cuadraditos

Eyes:
    mov x10, 0// color negro             
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
           
    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

antenas:
    movz x10, 0xFFFF, lsl 00    // color verde           
    mov x3, 17 // eje x  
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 17 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1//  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
                
    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 17 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
        
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 16 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
         
    mov x3, 22 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 16 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

MarcianitoArms:
    mov x3, 15 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 2 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 23 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 2 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 14 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 20 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 24 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 20 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    
Mouth:
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 22 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 22 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 22 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 23 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 2 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 20 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 23 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 2 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos


Fila: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, HeadArgs
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, HeadArgs
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30
    
Marciano_numero2:
        sub sp,sp, #16 
        str x30,[sp,#8] 
HeadArgs2:
    movz x10, 0xDD00, lsl 0 // color Verde
    mov x3, 18
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 30  
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 9 // longitud de vertice
    mov x9, x6  // x9 = 6
    mov x2, 5 // altura de base hasta vertice
    mul x2, x2, x22
    add x2, x2, x4
    mov x14, 4 
    mov x15, x14
    bl Triangulito
    
    mov x3, 14 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 11  //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 11  //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Eyes2:
    movz x10, 0
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Tentacles:
    movz x10, 0xDD00, lsl 00 
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 37 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 37 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 22 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
     
    mov x3, 18 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 3 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 39 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 39 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 15 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 39 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 23 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 39 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Fila2: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, HeadArgs2 
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, HeadArgs2

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30


Marciano_numero3:

        sub sp,sp, #16 
        str x30,[sp,#8] 

HeadArgs3:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 0
    mov x3, 17
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 31  
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 17 // longitud de vertice
    mov x9, x6
    mov x2, 14 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 5 
    mov x15, x14
    bl Triangulito2
    mov x3, 35 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 47 //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 14 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 32 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 34  //  largo cuad
    mov x9, x6 
    mov x2, 2 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
Eyes3:
    movz x10, 0
    mov x3, 46 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 64 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Tentacles2:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 0
    mov x3, 46 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 64 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 41 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 55 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 69 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 33 // eje x
    add x3, x3, x19 
    add x3, x3, x7
    mov x4, 123 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 77 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 123 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
Fila3: 
    add x19, x19, 70  // DISTANCIA ENTRE CADA REPETICION DE SPRITE
    sub x21, x21, 1
    cbnz x21, HeadArgs3 
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30


Player: 
        sub sp,sp, #16 
        str x30,[sp,#8] 

    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 10 // eje x
    add x3, x3, x16
    mov x4, 460 // eje y
    mov x6, 50 // largo
    mov x9, x6 
    mov x2,  11// alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 15 // eje x
    add x3, x3, x16
    mov x4, 455 // eje y
    mov x6, 40 // largo
    mov x9, x6 
    mov x2,  10 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 31 // eje x
    add x3, x3, x16
    mov x4, 448 // eje y
    mov x6, 8 // largo
    mov x9, x6 
    mov x2,  10 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  
br x30

Cobertura:
        sub sp,sp, #16 
        str x30,[sp,#8] 

Textures:

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
    cbnz x21, Textures
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  
br x30

DisparosPlayer:
        sub sp,sp, #16 
        str x30,[sp,#8] 
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 294 // eje x
    mov x4, 400 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  
br x30


DisparosMarcianos:
        sub sp,sp, #16 
        str x30,[sp,#8] 
     movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00

    mov x3, 14
    add x3, x3, x18
    mov x4, 280
    add x4, x4, x17  
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 19
    add x3, x3, x18
    mov x4, 285
    add x4, x4, x17  
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 15
    add x3, x3, x18
    mov x4, 290  
    add x4, x4, x17
    mov x14, 5
    mov x15, x14
    bl LineaDiagonalDer
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  
br x30

delay:
    movk x13, 0x002F, lsl 00 // FF para 6 segundos
delayloop1:
    movz x12, 0xFF, lsl 16
    movk x12, 0xFFFF, lsl 00
bri:
    sub x12, x12, 1
    cbnz x12, bri
    sub x13, x13, 1
    cbnz x13, delayloop1
   
br x30

Marciano_numero1.2:
        sub sp,sp, #16 
        str x30,[sp,#8] 
           
  

HeadArgs1.2:
    movz x10, 0xFFFF, lsl 00     // color Celeste  
    mov x0, x20  // posicion base    
    mov x1, xzr // indice de cuad          
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7 // x mas desplazamiento por frame
    mov x4, 18 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8  // y mas desplazamiento por frame
    mov x5, 640 //640
    mov x6, 7 //  largo cuad
    mul x6, x6, x22
    mov x9, x6
    mov x2, 4 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4  
    bl Cuadraditos

Eyes1.2:
    mov x10, 0// color negro             
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
           
    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 19 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

antenas1.2:
    movz x10, 0xFFFF, lsl 00    // color verde           
    mov x3, 17 // eje x  
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 17 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1//  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
                
    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 17 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
        
    mov x3, 16 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 16 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
         
    mov x3, 22 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 16 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

MarcianitoArms1.2:
    mov x3, 45 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 57 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 9 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 69 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 57 // eje y
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 9 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 42 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 51 // eje y
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 12 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 72 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 51 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 12 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    
Mouth1.2:
    mov x3, 51 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 66 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 63 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 66 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    
    mov x3, 48 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 69 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 66 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 69 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Fila1.2: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, HeadArgs1.2
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, HeadArgs1.2
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30


Marciano_numero2.2:
        sub sp,sp, #16 
        str x30,[sp,#8] 
HeadArgs2.2:
    movz x10, 0xDD00, lsl 0 // color Verde
    mov x3, 18
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 30  
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 9 // longitud de vertice
    mov x9, x6  // x9 = 6
    mov x2, 5 // altura de base hasta vertice
    mul x2, x2, x22
    add x2, x2, x4
    mov x14, 4 
    mov x15, x14
    bl Triangulito
    
    mov x3, 14 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 11  //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 11  //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Eyes2.2:
    movz x10, 0
    mov x3, 17 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 21 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 35 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8    
    mov x6, 1 //  largo cuad
    mul x6, x6, x22
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Tentacles2.2:
    movz x10, 0xDD00, lsl 00  //
    mov x3, 48 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 111 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 45 // eje x  //
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 114 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 66 // eje x  //
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 111 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 69 // eje x  //
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 114 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
     
    mov x3, 54 // eje x //
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 111 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 9 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
   

    mov x3, 48 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 117 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 66 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 117 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 3 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

Fila2.2: 
    add x19, x19, 50
    sub x21, x21, 1
    cbnz x21, HeadArgs2.2 
    mov x19, 0
    mov x21, 11
    add x24, x24, 50
    sub x23, x23, 1
    cbnz x23, HeadArgs2.2

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30

Marciano_numero3.2:

        sub sp,sp, #16 
        str x30,[sp,#8] 

HeadArgs3.2:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 0
    mov x3, 17
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 31  
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 17 // longitud de vertice
    mov x9, x6
    mov x2, 14 // altura de base hasta vertice
    add x2, x2, x4
    mov x14, 5 
    mov x15, x14
    bl Triangulito2
    mov x3, 35 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 47 //  largo cuad
    mov x9, x6 
    mov x2, 6 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 14 // eje x
    mul x3, x3, x22
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 32 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 34  //  largo cuad
    mov x9, x6 
    mov x2, 2 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos
Eyes3.2:
    movz x10, 0
    mov x3, 46 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 64 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 36 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 1 // alto cuadrado
    mul x2, x2, x22
    add x2, x2, x4
    bl Cuadraditos

Tentacles3.2:
    movz x10, 0x99, lsl 16
	movk x10, 0x0099, lsl 0
    mov x3, 43 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 11 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 64 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 38 // eje y
    mul x4, x4, x22
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 11 //  largo cuad
    mov x9, x6 
    mov x2, 4 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 39 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 55 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 71 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 119 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x3, 42 // eje x
    add x3, x3, x19 
    add x3, x3, x7
    mov x4, 123 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    mov x3, 68 // eje x
    add x3, x3, x19
    add x3, x3, x7
    mov x4, 123 // eje y
    add x4, x4, x24
    add x4, x4, x8
    mov x6, 8 //  largo cuad
    mov x9, x6 
    mov x2, 3 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
Fila3.2: 
    add x19, x19, 70  // DISTANCIA ENTRE CADA REPETICION DE SPRITE
    sub x21, x21, 1
    cbnz x21, HeadArgs3.2 
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16  

br x30

delay1:
    
    movk x13, 0x000F, lsl 00 // FF para 6 segundos
delayloop:
    movz x12, 0xFF, lsl 16
    movk x12, 0xFFFF, lsl 00
bri1:
    sub x12, x12, 1
    cbnz x12, bri2
    sub x13, x13, 1
    cbnz x13, delayloop

   
br x30



delay2:
    
    movk x13, 0x0008, lsl 00 // FF para 6 segundos
delayloop2:
    movz x12, 0xFF, lsl 16
    movk x12, 0xFFFF, lsl 00
bri2:
    sub x12, x12, 1
    cbnz x12, bri2
    sub x13, x13, 1
    cbnz x13, delayloop2

   
br x30



Explosion1: 
        sub sp,sp, #16 
        str x30,[sp,#8] 


    
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    
    mov x3, 150 // eje x
    mov x4, 240 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 150 // eje xw
    mov x4, 261 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 137 // eje x
    mov x4, 255 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 155 // eje x
    mov x4, 255 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 137
    mov x4, 242  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 163
    mov x4, 242  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 144
    mov x4, 261  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 156
    mov x4, 261  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16
br x30


Explosion2: 
        sub sp,sp, #16 
        str x30,[sp,#8] 


    
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    
    mov x3, 290 // eje x
    mov x4, 250 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 290 // eje xw
    mov x4, 271 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 277 // eje x
    mov x4, 265 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 295 // eje x
    mov x4, 265 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 277
    mov x4, 252  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 303
    mov x4, 252  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 284
    mov x4, 271  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 296
    mov x4, 271  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16
br x30

Explosion3: 
        sub sp,sp, #16 
        str x30,[sp,#8] 


    
    movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    
    mov x3, 470 // eje x
    mov x4, 250 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 470 // eje xw
    mov x4, 271 // eje y
    mov x2, 10 // largo linea
    add x2, x2, x4 
    bl LineaVertical
    mov x3, 457 // eje x
    mov x4, 265 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 475 // eje x
    mov x4, 265 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 457
    mov x4, 252  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer
    mov x3, 483
    mov x4, 252  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 464
    mov x4, 271  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalIzq
    mov x3, 476
    mov x4, 271  
    mov x14, 9
    mov x15, x14
    bl LineaDiagonalDer

        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16
br x30

Dibujo2:
        sub sp,sp, #16 
        str x30,[sp,#8] 
    
    movz x10, 0xFF, lsl 16
movk x10, 0xFFFF, lsl 00
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
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16
br x30

Dibujo3:
        sub sp,sp, #16 
        str x30,[sp,#8] 

   movz x10, 0xFF, lsl 16
movk x10, 0xFFFF, lsl 00
    mov x3, 588 // eje x
    mov x4, 6 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4  
    bl LineaVertical
    mov x3, 579 // eje x
    mov x4, 6 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 579 // eje x
    mov x4, 17 // eje y
    mov x6, 10 // largo linea
    mov x9, x6
    bl LineaHorizontal
    mov x3, 580 // eje x
    mov x4, 11 // eje y
    mov x6, 9 // largo linea
    mov x9, x6
    bl LineaHorizontal
  
        ldr x11,[sp,#0] 
        ldr x30,[sp,#8] 
        add sp,sp, #16
br x30

///////////////////////////////////////////////////////////////////////////////////



