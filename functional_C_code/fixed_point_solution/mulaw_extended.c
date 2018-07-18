#include <stdio.h>
#include <stdlib.h>

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
        printf("ERROR\n");
        exit(0);
        return 0xFFFFFFFF;
    }
    if( x < 0x0200) {
        // Min return:  0x0
        // Max return:  0xFF
        return( x - 0x100); 
    }
    if( x < 0x0400) {
        // Min return:  0x100
        // Max return:  0x1FF
        return( 0x0100 + (((x - 0x0200) * 0x0080) >> 8));
    }
    if( x < 0x0800) {
        // Min return:  0x200
        // Max return:  0x2FF
        return( 0x0200 + (((x - 0x0400) * 0x0040) >> 8));
    }
    if( x < 0x1000) {
        // Min return:  0x300
        // Max return:  0x3FF
        return( 0x0300 + (((x - 0x0800) * 0x0020) >> 8));
    }
    if( x < 0x2000) {
        // Min return:  0x400
        // Max return:  0x4FF
        return( 0x0400 + (((x - 0x1000) * 0x0010) >> 8));
    }
    if( x < 0x4000) {
        // Min return:  0x500
        // Max return:  0x5FF
        return( 0x0500 + (((x - 0x2000) * 0x0008) >> 8));
    }
    if( x < 0x8000) {
        // Min return:  0x600
        // Max return:  0x6FF
        return( 0x0600 + (((x - 0x4000) * 0x0004) >> 8));
    }
    if( x < 0x10000) {
        // Min return:  0x700
        // Max return:  0x7FF
        return( 0x0700 + (((x - 0x8000) * 0x0002) >> 8));
    }
    printf("ERROR\n");
    exit(0);
    return 0xFFFFFFFF;
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
    printf("Encode 1: %x \n", result);
    //       0d255   d<<15   >> 7 = <<8
    result = (0xFF * result) >> 7;
    printf("Encode 2: %x \n", result);
    //       1      + d<<8
    result = 0x0100 + result;
    printf("Encode 3: %x \n", result);
    //       <<8              >> 4 = <<4
    result = fppwlog2(result) >> 4;
	printf("Encode 4: %x \n", result);
    //         <<4   *  (1/8)<<4 >>4 = <<4
    result = ((result * (0x02)) >> 4);
    printf("Encode 5: %x \n", result);
    // 8 bit output, xxxx . xxxx
    return result;
}

unsigned int fppw2exp(unsigned int x) {
    // x < 0d0.25
    if (x < 0x0400) {
        return(((0x0C19 * x) >> 12) + 0x1000);
    }
    // x < 0d0.50
    if (x < 0x0800) {
        return(((0x0E66 * x) >> 12) + 0x0F6D);
    }
    // x < 0d0.75
    if (x < 0x0C00) {
        return(((0x1127 * x) >> 12) + 0x0E0C);
    }
    // x < 0d1.00
    if (x < 0x1000) {
        return(((0x145A * x) >> 12) + 0x0BA6);
    }
    // x < 0d1.25
    if (x < 0x1400) {
        return(((0x1831 * x) >> 12) + 0x0687);
    }
    // x < 0d1.50
    if (x < 0x1800) {
        return(((0x1CCD * x) >> 12) + 0x020C);
    }
    // x < 0d1.75
    if (x < 0x1C00) {
        return(((0x224E * x) >> 12) - 0x0635);
    }
    // x < 0d2.00
    if (x < 0x2000) {
        return(((0x28B4 * x) >> 12) - 0x1168);
    }
    printf("ERROR\n");
    exit(0);
    return 0xFFFFFFFF;
}

// Does x^8
// The problem is there is a lot of error here...
unsigned int fpexp8(unsigned int x) {
    unsigned int result = x;
	int i = 0; 
    for (i=0; i<7; i++) {
        result = result * x;
        result = result >> 12;
        printf("x^%d :: %x\n", i + 2, result);
    }
    
    return result;
}

/*
 * Fixied point Mu-Law decoder
 * takes in 8-bit
 * puts out 16-bit
 *
 * (1/255)((1+255)^x - 1)
 * (1/255)((256)^x - 1)
 * (1/255)((2^x)^8 - 1)
 */
unsigned int decode(unsigned int x){
    unsigned int result = x;
    printf("Decode 1: %x \n", result);
    result = result << 8;       // 12 bits of decimal
    printf("Decode 2: %x \n", result);
    result = fppw2exp(result);
    printf("Decode 3: %x \n", result);
    result = fpexp8(result);
    printf("Decode 4: %x\n", result);
    result = result - 0x01000;
    printf("Decode 5: %x \n", result);
    //result = result * /*(1/255)*/
    result = result * 0x10;
    result = result >> 12;
    //result = result >> /*8?*/;
    return result;
}

int test(unsigned int sample) {
    unsigned int encoded_sample;
    unsigned int decoded_sample;
    
    printf("==== SAMPLE: %x \n", sample);
    encoded_sample = encode(sample);
    printf("------------\n");
    decoded_sample = decode(encoded_sample);
    printf("------------\n");
    printf("Encoded Sample: %x \n", encoded_sample);
    printf("Decoded Sample: %x \n", decoded_sample);
    printf("Match??   %x == %x\n", sample, decoded_sample);
    printf("decimal:  %f == %f\n", sample/32768.0, decoded_sample/4096.0);
    printf("==~~~~~~~~~~~~~~~~~~~==\n\n");
}

int main(void) {
    unsigned int sample;
    unsigned int encoded_sample;
    unsigned int decoded_sample;
    
    /*
        Sanity Checks:
    */
    printf("Sanity Checks:\n");
    printf("==============\n");
    // 0.1234567 * 2^15
    sample = 0x0FCD;
    test(sample);
    
    // 0.0078125 * 2^15; 
    sample = 0x0100;
    test(sample);

    /*
        Tests::
    */
    printf("Tests:\n");
    printf("==============\n");
    // min
    // 0.0 * 2^15; 
    sample = 0x0000;
    test(sample);
    
    // 0.1 * 2^15
    sample = 0x0CCD;
    test(sample);
    
    // 0.2 * 2^15
    sample = 0x199A;
    test(sample);
    
    // 0.3 * 2^15
    sample = 0x2666;
    test(sample);

    // 0.4 * 2^15
    sample = 0x3333;
    test(sample);
    
    // 0.5 * 2^15
    sample = 0x4000;
    test(sample);
    
    // 0.6 * 2^15
    sample = 0x4CCD;
    test(sample);
    
    // 0.7 * 2^15
    sample = 0x599A;
    test(sample);
    
    // 0.8 * 2^15
    sample = 0x6666;
    test(sample);
    
    // 0.9 * 2^15
    sample = 0x7333;
    test(sample);
    
    // max valid value
    // 1.0 * 2^15; 
    sample = 0x7FFF;
    test(sample);
    
    // first max invalid value
    // 1.0 * 2^15; 
    sample = 0x8000;
    test(sample);
    
    return 0;
}
