/*
This file is part of mfaktc.
Copyright (C) 2009, 2010, 2011, 2012, 2014  Oliver Weihe (o.weihe@t-online.de)

mfaktc is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

mfaktc is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
                                
You should have received a copy of the GNU General Public License
along with mfaktc.  If not, see <http://www.gnu.org/licenses/>.
*/

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

#ifdef SHORTCUT_75BIT
extern void mfaktc_75_gs(unsigned int exp, int96 k_base, unsigned int *bit_array, unsigned int bits_to_process, int shiftcount, int192 b, unsigned int *RES);
#else
extern void mfaktc_95_gs(unsigned int exp, int96 k_base, unsigned int *bit_array, unsigned int bits_to_process, int shiftcount, int192 b, unsigned int *RES);
#endif

#define TF_96BIT
#include "tf_common.cu"
#include "tf_common_gs.cu"
#undef TF_96BIT