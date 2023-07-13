
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
    b PaintCuad

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








/* Canvas: 
    mov x14, 0                // prototipo
    add x14, x3, x6
    cmp x14, 640
    B.gt False  
    mov x14, 0
    add x14, x4, x2
    cmp x14, 480
    B.gt False 
    b False
Return2:
stur w10,[x0]
br x30
*/ // solucion, antes de saltar, poner x30 en el stack, saltar a la funcion, termina y antes de volver, saca x30 del stack de vuelta





