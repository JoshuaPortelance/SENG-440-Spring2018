#include <stdio.h>

/*
 * Fixed point piecewise log2.
 * Using linear approximations.
 */
unsigned int fppwlog2(unsigned int x) {
    /*
     *  All constants are / 2^8
     *  0xXX.XX
     *  x is also assumed to be 2^8
     */ 

    if( x < 0x0100) {
        return 0xFFFFF; // Error.
    }
    if( x < 0x0200) {
        // Min return:  0x0
        // Max return:  0xFF
        return( x - 0x100); 
    }
    if( x < 0x0400) {
        // Min return:  0x100
        // Max return:  0x1FF
        return( 0x0100 + ((x - 0x0200) * 0x0080) >> 8);
    }
    if( x < 0x0800) {
        // Min return:  0x200
        // Max return:  0x2FF
        return( 0x0200 + ((x - 0x0400) * 0x0040) >> 8);
    }
    if( x < 0x1000) {
        // Min return:  0x300
        // Max return:  0x3FF
        return( 0x0300 + ((x - 0x0800) * 0x0020) >> 8);
    }
    if( x < 0x2000) {
        // Min return:  0x400
        // Max return:  0x4FF
        return( 0x0400 + ((x - 0x1000) * 0x0010) >> 8);
    }
    if( x < 0x4000) {
        // Min return:  0x500
        // Max return:  0x5FF
        return( 0x0500 + ((x - 0x2000) * 0x0008) >> 8);
    }
    if( x < 0x8000) {
        // Min return:  0x600
        // Max return:  0x6FF
        return( 0x0600 + ((x - 0x4000) * 0x0004) >> 8);
    }
    if( x < 0x10000) {
        // Min return:  0x700
        // Max return:  0x7FF
        return( 0x0700 + ((x - 0x8000) * 0x0002) >> 8);
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

    
    unsigned int result = x;
    //       0d255   d<<15   >> 7 = <<8
    result = (0xFF * result) >> 7;
    //       1      + d<<8
    result = 0x0100 + result;
    //       <<8              >> 4 = <<4
    result = fppwlog2(result) >> 4;
    //         <<4   *  (1/8)<<4 >>4 = <<4
    result = ((result * (0x02)) >> 4);
    // 8 bit output, xxxx . xxxx
    return result;
}

unsigned int fppw2exp(unsigned int x) {
    if (x < 0x0040) {
        return(((0x0061 * x) >> 8) + 0x00E1);
    }
    if (x < 0x0080) {
        return(((0x0073 * x) >> 8) + 0x00EF);
    }
    if (x < 0x00C0) {
        return(((0x0089 * x) >> 8) + 0x00FA);
    }
    if (x < 0x0100) {
        return(((0x00A3 * x) >> 8) + 0x0100);
    }
    if (x < 0x0140) {
        return(((0x00C2 * x) >> 8) + 0x0100);
    }
    if (x < 0x0180) {
        return(((0x00E6 * x) >> 8) + 0x00F7);
    }
    if (x < 0x01C0) {
        return(((0x0112 * x) >> 8) + 0x00E1);
    }
    if (x < 0x0200) {
        return(((0x0164 * x) >> 8) + 0x00BA);
    }
    return 0xFFFF;
}

unsigned int fpexp8(unsigned int x) {
    unsigned int result = x;
    
    // multiplies x by itself 8 times while handling shifts.
    for (int i=0; i<8; i++) {
        result = result * result;
        result = result >> 8;
    }
    
    return result;
}

/*
 * Fixied point Mu-Law decoder
 * takes in 8-bit
 * puts out 16-bit
 *
 * (1/255)((1+255)^x - 1)
 */
unsigned int decode(unsigned int x){
    unsigned int result = x;
    result = result << 4;
    result = fppw2exp(result);
    result = fpexp8(result);
    result = result - 0x0100;
    //result = result * /*(1/255)*/
    //result = result >> /*8?*/;
    return result;
    /*
    result = 
    
    
    result = (result << 4) * (0x80)
    result = fppwexp2(result) << 4
    result = result - 0x100
    result = ((result * 0x80) - )
    */
}

int main(void) {
    unsigned int sample;
    unsigned int encoded_sample;
    unsigned int decoded_sample;

    sample = 0x0FCD; //0.1234567 * 2^15; same as <<15, 1<<15 = 0x8000
    encoded_sample = encode(sample);
    decoded_sample = decode(encoded_sample);
    
    printf("Sample: %x \n", sample);
    printf("Encoded Sample: %x \n", encoded_sample);
    printf("Decoded Sample: %f \n", decoded_sample);
    
    return 0;
}