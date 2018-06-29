#include <stdio.h>
#include <stdlib.h>

float mu = 255;

/*
 * Floating point piecewise log2.
 * Using linear approximations.
 */
float fpwlog2(float x) {
    if( x < 1.0) {
        return -1; // Error.
    }
    if( x < 2.0) {
        return( x-1.0);
    }
    if( x < 4.0) {
        return( 1.0 + (x-2.0)/2.0);
    }
    if( x < 8.0) {
        return( 2.0 + (x-4.0)/4.0);
    }
    if( x < 16.0) {
        return( 3.0 + (x-8.0)/8.0);
    }
    if( x < 32.0) {
        return( 4.0 + (x-16.0)/16.0);
    }
    if( x < 64.0) {
        return( 5.0 + (x-32.0)/32.0);
    }
    if( x < 128.0) {
        return( 6.0 + (x-64.0)/64.0);
    }
    if( x < 256.0) {
        return( 7.0 + (x-128.0)/128.0);
    }
    if( x < 512.0) {
        return( 8.0 + (x-256.0)/256.0);
    }
    return -1; // Error.
}

/*
 * Performs 2^x where -1 <= x <= 1.
 * Using linear approximations.
 */
float fpw2exp(float x) {
    if (x < -1) {
        return -1; // Error.
    }
    if (x < -0.75) {
        return( ((473.0/1250.0) * x) + (549.0/625.0));
    }
    if (x < -0.5) {
        return( ((9.0/20.0) * x) + (9321.0/10000.0));
    }
    if (x < -0.25) {
        return( ((669.0/1250.0) * x) + (9747.0/10000.0));
    }
    if (x < 0.0) {
        return( ((1591.0/2500.0) * x) + (1.0));
    }
    if (x < 0.25) {
        return( ((473.0/625.0) * x) + (1.0));
    }
    if (x < 0.5) {
        return( ((9.0/10.0) * x) + (241.0/250.0));
    }
    if (x < 0.75) {
        return( ((134.0/125.0) * x) + (439.0/500.0));
    }
    if (x < 1.0) {
        return( ((1591.0/1250.0) * x) + (909.0/1250.0));
    }
    return -1; // Error.
}

/*
 * Performs x^8.
 */
float fxexp8(float x) {
    return x * x * x * x * x * x * x * x;
}

/*
 * Floating point Mu-Law encoder.
 * Assuming that 0 <= x <= 1.
 */
float encode(float x) {
    if (x < 0) {
        x = x * -1.0;
    }
    return (1.0 / 8.0) * fpwlog2(1.0 + (mu * x));
}

/*
 * Floating point Mu-Law decoder.
 * Assuming that -1 <= y <= 1.
 */
float decode(float y) {
    if (y < 0) {
        y = y * -1.0;
    }
    return (1.0 / 255.0) * (fxexp8(fpw2exp(y)) - 1.0);
}

int main(void) {
    float sample;
    float encoded_sample;
    float decoded_sample;

    sample = 0.1234567;
    encoded_sample = encode(sample);
    decoded_sample = decode(encoded_sample);
    
    printf("Sample: %f \n", sample);
    printf("Encoded Sample: %f \n", encoded_sample);
    printf("Decoded Sample: %f \n", decoded_sample);
    
    return 0;
}
