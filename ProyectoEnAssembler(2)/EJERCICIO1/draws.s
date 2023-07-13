.ifndef draws_s 
.equ draws_s, 0

.include "data.s"
.include "utils.s"
.include "figures.s"

/*
 * draw_street
 *
 */ 

draw_street:
    sub sp, sp, #40
    str x4, [sp, #32]
    str x3, [sp, #24]
    str x8, [sp, #16]
    str x5, [sp, #8]
    str x30, [sp]
    
    /* draw street */ 
    mov x5, #160 
    mov x8, #640
    ldr w24, gray3_color
    mov x3, #0
    mov x4, #479
    bl draw_rectangule

    /* draw yellow lines of the street */ 
    mov x4, #400
    mov x5, #2 
    mov x8, #640
    ldr w24, yellow_color
    bl draw_rectangule
    
    mov x4, #395 
    bl draw_rectangule

    ldr x4, [sp, #32]
    ldr x3, [sp, #24]
    ldr x8, [sp, #16]
    ldr x5, [sp, #8] 
    ldr x30, [sp]
    add sp, sp, #24 
    br x30

draw_bus:
    sub sp, sp, #40
    str x4, [sp, #32]
    str x3, [sp, #24]
    str x8, [sp, #16]
    str x5, [sp, #8]
    str x30, [sp]

    /* draw body of the bus */
    
    
    mov x5, #80    
    mov x8, #130
    bl draw_rectangule

    /* draw the left window */
    sub x4, x4, #10  
    add x3, x3, #5
    mov x5, #60 
    mov x8, #25 
    ldr w24, gray7_color 
    bl draw_rectangule

    /* draw the right window */ 
    add x3, x3, #95
    mov x5, #60  
    mov x8, #25
    ldr w24, gray7_color 
    bl draw_rectangule
    
    /* draw wheels */ 

    add x4, x4, #13 
    add x3, x3, #15 
    mov x5, #12
    ldr w18, black_color 
    bl pintarCirculo

    sub x3, x3, #100 
    bl pintarCirculo
    
    ldr x4, [sp, #32]
    ldr x3, [sp, #24]
    ldr x8, [sp, #16]
    ldr x5, [sp, #8] 
    ldr x30, [sp]
    add sp, sp, #24 
    br x30

/* 
 *  @brief: draw the sun with init address in (x3, x4) and radius x5, color w18 
 *  @param: x3, x4, x5, w18
 *  @return: none
 *  @saveStack: x3, x4, x5, x30
 *
 *  use the function pintarCirculo
 */ 
 /* 
draw_clouds:
    add x4, x4, #20
    add x3, x4, #22
    mov X5, #15
    ldr w18, white_color
    bl pintarCirculo

    sub x3, x3, #200
    bl pintarCirculo 

    ldr x4, [sp, #32]
    ldr x3, [sp, #24]
    ldr x8, [sp, #16]
    ldr x5, [sp, #8] 
    ldr x30, [sp]
    add sp, sp, #24 
    br x30
    */

draw_sun:
    sub sp, sp, #32
    str x5, [sp, #24]
    str x4, [sp, #16]
    str x3, [sp, #8]
    str x30, [sp] 

    /* draw sun */
    
    mov x3, #78 
    mov x4, #66
    mov x5, #40
    ldr w18, red_color
    bl pintarCirculo
    
    mov x5, #30 
    ldr w18, orange_color
    bl pintarCirculo

    mov x5, #20
    ldr w18, yellow_sun_color
    bl pintarCirculo

    ldr x5, [sp, #24]
    ldr x4, [sp, #16]
    ldr x3, [sp, #8]
    ldr x30, [sp]
    add sp, sp, #32
    br x30

.endif
