#include <stdio.h>
#include <stdlib.h>

/*
 * Fixed point piecewise log2.
 * Using linear approximations.
 */
unsigned int fppwlog2(unsigned int x) {
    /*
     *  All constants are  d<<12
     *  Therefore the "decimal" is located here: 0xY.YYY
     *  The input x is also in this form.
     */ 

    if( x < 0x01000) {
        printf("ERROR\n");
        exit(0);
        return 0xFFFFFFFF;
    }
    if( x < 0x02000) {
        return( x - 0x1000); 
    }
    if( x < 0x04000) {
        return( 0x01000 + (((x - 0x02000) * 0x00800) >> 12));
    }
    if( x < 0x08000) {
        return( 0x02000 + (((x - 0x04000) * 0x00400) >> 12));
    }
    if( x < 0x10000) {
        return( 0x03000 + (((x - 0x08000) * 0x00200) >> 12));
    }
    if( x < 0x20000) {
        return( 0x04000 + (((x - 0x10000) * 0x00100) >> 12));
    }
    if( x < 0x40000) {
        return( 0x05000 + (((x - 0x20000) * 0x00080) >> 12));
    }
    if( x < 0x80000) {
        return( 0x06000 + (((x - 0x40000) * 0x00040) >> 12));
    }
    if( x < 0x100000) {
        return( 0x07000 + (((x - 0x80000) * 0x00020) >> 12));
    }
    printf("ERROR\n");
    exit(0);
    return 0xFFFFFFFF;
}


/*
 * Fixed point Mu-Law encoder.
 * Assuming that in decimal form 0 <= x <= 1
 * Actual input is: 0 <= x <= 32,768
 *                  0x0000 <= x <= 0x8000
 * All values are 16 bit unsigned integers representing d<<15.
 *      This means there are 15 bits for the decimal.
 * Need 15 bits to represent the decimal portion.
 *  
 * This function implements the equation:
 *      (1.0 / 8.0) * log2(1.0 + (255 * x))
 *
 * Output is 8 bits with a scaling of d<<7.
 *      Y.YYY YYYY
 */
unsigned int encode(unsigned int x) {
    unsigned int result = x;
    printf("Encode 1: %x \n", result);
    
    //       0d255   <<15   >> 3 = <<12
    result = (0xFF * result) >> 3;
    printf("Encode 2: %x \n", result);
    
    //       1<<12  + d<<12
    result = 0x1000 + result;
    printf("Encode 3: %x \n", result);
    
    //       <<12  =  <<12
    result = fppwlog2(result);
	printf("Encode 4: %x \n", result);
	
    //         <<12   * (1/8)<<12  >>12 = <<12
    result = ((result * (0x200)) >> 12);
    printf("Encode 5: %x \n", result);
    
    //        <<12   >>5 = <<7
    result = result >> 5;
	printf("Encode 6: %x \n", result);

    return result;
}

/*
 * Fixed point piecewise 2^x.
 * Using linear approximations.
 *
 * Intervals are more narrow afte x > 1 since the
 * slope start to change rapidly.
 */
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
    // x < 0d1.1
    if (x < 0x119A) {
        return(((0x16F6 * x) >> 12) + 0x090A);
    }
    // x < 0d1.2
    if (x < 0x1333) {
        return(((0x18A0 * x) >> 12) + 0x0736);
    }
    // x < 0d1.3
    if (x < 0x14CD) {
        return(((0x1A62 * x) >> 12) + 0x0519);
    }
    // x < 0d1.4
    if (x < 0x1666) {
        return(((0x1C46 * x) >> 12) + 0x02A5);
    }
    // x < 0d1.5
    if (x < 0x1800) {
        return(((0x1E4E * x) >> 12) - 0x0034);
    }
    // x < 0d1.6
    if (x < 0x199A) {
        return(((0x207B * x) >> 12) - 0x0377);
    }
    // x < 0d1.7
    if (x < 0x1B33) {
        return(((0x22D1 * x) >> 12) - 0x0734);
    }
    // x < 0d1.8
    if (x < 0x1CCD) {
        return(((0x1DD3 * x) >> 12) - 0x0B64);
    }
    // x < 0d1.9
    if (x < 0x1E66) {
        return(((0x2800 * x) >> 12) - 0x104A);
    }
    // x < 0d2.0
    if (x < 0x2000) {
        return(((0x2AE1 * x) >> 12) - 0x15C3);
    }
    printf("ERROR\n");
    exit(0);
    return 0xFFFFFFFF;
}

/*
 * Fixed point x^8
 *
 * This function assumes that value of x is scaled by <<12.
 */
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
 * takes in 8-bit with a scaling of d<<7.
 *      Y.YYY YYYY
 *
 * Implements the equation:
 *      (1/255)((1+255)^x - 1) =
 *      (1/255)((256)^x - 1) =
 *      **(1/255)((2^x)^8 - 1)**
 *
 * Output is a 16 bit value with a scaling of d<<12
 */
unsigned int decode(unsigned int x){
    unsigned int result = x;
    printf("Decode 1: %x \n", result);
    
    //        <<7    << 5 = <<12
    result = result << 5;
    printf("Decode 2: %x \n", result);
    
    //        <<12
    result = fppw2exp(result);
    printf("Decode 3: %x \n", result);
    
    //        <<12
    result = fpexp8(result);
    printf("Decode 4: %x\n", result);
    
    //        <<12  -  1<<12   = <<12
    result = result - 0x01000;
    printf("Decode 5: %x \n", result);
    
    //        (<<12 * (1/255)<<12) >> 12  = <<12
    result = (result * 0x10) >> 12;
    printf("Decode 6: %x \n", result);
    
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
    printf("==============\n");
    printf("Sanity Checks:\n");
    printf("==============\n\n");
    // 0.1234567 * 2^15
    sample = 0x0FCD;
    test(sample);
    
    // 0.0078125 * 2^15; 
    sample = 0x0100;
    test(sample);

    /*
        Tests:
    */
    printf("==============\n");
    printf("Tests:\n");
    printf("==============\n\n");
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