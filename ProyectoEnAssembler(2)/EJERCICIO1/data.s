.ifndef data_s
.equ data_s, 0

.data 

bufferSecundario: .skip BYTES_FRAMEBUFFER

.equ key_W, 0x2
.equ key_A, 0x4
.equ key_S, 0x8
.equ key_D, 0x10
.equ key_SPACE, 0x20

 // A mayor número mas lento va la animación

delay: .dword 0xFFFF 

/* sky color */
blue1_color: .word 0x99FFFF

/* street color */
gray3_color: .word 0x404040

/* sun colors */
red_color: .word 0xFF3333
orange_color: .word 0xFF9933
yellow_sun_color: .word 0xFFFF33

/* bus color */
blue2_color: .word 0x0080FF
yellow_color: .word 0xFFFF00
gray7_color: .word 0xA8C8E8
black_color: .word 0x000000

/*clouds color */
white_color : .word 0xFFFFFF

// Variable para guardar la dirección de memoria del comienzo del frame buffer
dir_frameBuffer: .dword 0

.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32
.equ SCREEN_PIXELS, SCREEN_WIDTH * SCREEN_HEIGH
.equ BYTES_PER_PIXEL, 4
.equ BITS_PER_PIXEL, 8 * BYTES_PER_PIXEL
.equ BYTES_FRAMEBUFFER, SCREEN_PIXELS * BYTES_PER_PIXEL

/* GPIO */
.equ GPIO_BASE,    0x3f200000
.equ GPIO_GPFSEL0, 0x00
.equ GPIO_GPLEV0,  0x34

.endif
