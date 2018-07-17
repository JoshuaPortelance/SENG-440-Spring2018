#include <stdio.h>

/*
 * Fixed point piecewise log2.
 * Using linear approximations.
 */
unsigned int fppwlog2(unsigned int x) {
    /*
     *  All constants are / 2^8
     *  x is also assumed to be 2^8
     */ 

    if( x < 0x100) {
        return 0xFFFFF; // Error.
    }
    if( x < 0x200) {
        return( x - 0x100);
    }
    if( x < 0x400) {
        return( 0x100 + (x - 0x200) * 0x80);    // / 2.0 == * 0.5 * 2^8 = 0x80
    }
    if( x < 0x800) {
        return( 0x200 + (x - 0x400) * 0x40);     // / 4.0 == * .25
    }
    if( x < 0x1000) {
        return( 0x300 + (x - 0x800) * 0x20);
    }
    if( x < 0x2000) {
        return( 0x400 + (x - 0x1000) * 0x10);
    }
    if( x < 0x4000) {
        return( 0x500 + (x - 0x2000) * 0x8);
    }
    if( x < 0x8000) {
        return( 0x600 + (x - 0x4000) * 0x4);
    }
    if( x < 0x10000) {
        return( 0x700 + (x - 0x8000) * 0x2);
    }
    return 0xFFFFF; // Error.
}


/*
 * Fixed point Mu-Law encoder.
 * Assuming that 0 <= x <= 1
 * Need 15 bits to represent the decimal portion.
 * So the range is scaled by 2^15:
 *  0 <= x <= 32,768
 *  0x0000 <= x <= 0x8000
 */
unsigned int encode(unsigned int x) {
    // 0 - 8000 (hex)
    
    // Scale sample from 16 bits to 32 bits.
    // 1111 111 . 0000...
    // x.0000....
    //unsigned int result = x << 16;  //scales from 2^16 to 2^32
    
    // [0000 0000 0000 0000]
    
    // Perform encoding.
    //(1.0 / 8.0) * fpwlog2(1.0 + (255 * x));
    // 1/8 = 0.125. Can use all 16 bits for this so 0.125 * 2^16 = 0x2000
    // 255 needs 8 bits before decime so: 255 * 2^8 = 0xFF00
    // 1.0 needs 1 bit for 1 so 1 * 2^15 = 0x8000. Need to line up with 0xFF.00
    //      so shift it right by 7 to get 0x100
    // After the addition there will be an extra carry bit so there will be 17 bits total
    //      need to truncate 1 bit which is the right shift by 1

    
    unsigned int result = x
    //        255*2^15      ^15  >> ^8      
    result = (0x7F8000 * result) >> 22;
    result = 0x100 + result;
    result = (0x2000) * fppwlog2(result);
    
    // Scale 16 bits to 8 bits.
}

int main(void) {
    unsigned int sample;
    unsigned int encoded_sample;
    unsigned int decoded_sample;

    sample = 0x0FCD; //0.1234567 * 2^15; same as <<15, 1<<15 = 0x8000
    encoded_sample = encode(sample);
    decoded_sample = decode(encoded_sample);
    
    printf("Sample: %f \n", sample);
    printf("Encoded Sample: %f \n", encoded_sample);
    printf("Decoded Sample: %f \n", decoded_sample);
    
    return 0;
}
