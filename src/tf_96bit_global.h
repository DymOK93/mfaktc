#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>  

#include "params.h"
#include "my_types.h"
#include "compatibility.h"
#include "my_intrinsics.h"

#define NVCC_EXTERN
#include "sieve.h"
#include "timer.h"
#include "output.h"
#undef NVCC_EXTERN

#include "tf_debug.h"
#include "tf_96bit_base_math.cu"
#include "tf_96bit_helper.cu"

#include "gpusieve_helper.cu"

__global__ void
#ifdef SHORTCUT_75BIT
__launch_bounds__(THREADS_PER_BLOCK,2) mfaktc_75_gs(unsigned int exp, int96 k_base, unsigned int *bit_array, unsigned int bits_to_process, int shiftcount, int192 b, unsigned int *RES
#else
__launch_bounds__(THREADS_PER_BLOCK,2) mfaktc_95_gs(unsigned int exp, int96 k_base, unsigned int *bit_array, unsigned int bits_to_process, int shiftcount, int192 b, unsigned int *RES
#endif