unsigned int fppwlog2(register unsigned int x) {
    if( x < 0x01000)  { return 0xFFFFFFFF; } // ERROR
    if( x < 0x02000)  { return( x - 0x1000); }
    if( x < 0x04000)  { return( 0x01000 + (((x - 0x02000) * 0x00800) >> 12)); }
    if( x < 0x08000)  { return( 0x02000 + (((x - 0x04000) * 0x00400) >> 12)); }
    if( x < 0x10000)  { return( 0x03000 + (((x - 0x08000) * 0x00200) >> 12)); }
    if( x < 0x20000)  { return( 0x04000 + (((x - 0x10000) * 0x00100) >> 12)); }
    if( x < 0x40000)  { return( 0x05000 + (((x - 0x20000) * 0x00080) >> 12)); }
    if( x < 0x80000)  { return( 0x06000 + (((x - 0x40000) * 0x00040) >> 12)); }
    if( x < 0x100000) { return( 0x07000 + (((x - 0x80000) * 0x00020) >> 12)); }
    return 0xFFFFFFFF;
}

unsigned int encode(unsigned int x) {
    register unsigned int result = x;
    return ((fppwlog2(((result * 0xFF) >> 3) + 0x1000) * 0x200) >> 17);
}


unsigned int fppw2exp(register unsigned int x) {
    if (x < 0x0000) { return 0xFFFFFFFF; } // ERROR
    if (x < 0x0400) { return(((0x0C19 * x) >> 12) + 0x1000); } // x < 0d0.25
    if (x < 0x0800) { return(((0x0E66 * x) >> 12) + 0x0F6D); } // x < 0d0.50
    if (x < 0x0C00) { return(((0x1127 * x) >> 12) + 0x0E0C); } // x < 0d0.75
    if (x < 0x1000) { return(((0x145A * x) >> 12) + 0x0BA6); } // x < 0d1.00
    if (x < 0x1400) { return(((0x1831 * x) >> 12) + 0x0687); } // x < 0d1.25
    if (x < 0x1800) { return(((0x1CCD * x) >> 12) + 0x020C); } // x < 0d1.50
    if (x < 0x1C00) { return(((0x224E * x) >> 12) - 0x0635); } // x < 0d1.75
    if (x < 0x2000) { return(((0x28B4 * x) >> 12) - 0x1168); } // x < 0d2.00
    return 0xFFFFFFFF; // ERROR
}

unsigned int fpexp8(register unsigned int x) {
    return ((((((((((((((x * x) >> 12) * x) >> 12) * x) >> 12) * x) >> 12) * x) >> 12) * x) >> 12) * x) >> 12);
}

unsigned int decode(unsigned int x){
    register unsigned int result = x; //make into a register plez
    return (((fpexp8(fppw2exp(result <<5)) - 0x01000) * 0x10) >> 12);
}


//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
#include <stdio.h>
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