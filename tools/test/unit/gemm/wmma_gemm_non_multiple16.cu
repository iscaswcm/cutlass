/***************************************************************************************************
* Copyright (c) 2017-2019, NVIDIA CORPORATION.  All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification, are permitted
* provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright notice, this list of
*       conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright notice, this list of
*       conditions and the following disclaimer in the documentation and/or other materials
*       provided with the distribution.
*     * Neither the name of the NVIDIA CORPORATION nor the names of its contributors may be used
*       to endorse or promote products derived from this software without specific prior written
*       permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
* IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
* FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL NVIDIA CORPORATION BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
* OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
* STRICT LIABILITY, OR TOR (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
**************************************************************************************************/
#include "cutlass/wmma_matrix.h"
#if defined(CUTLASS_USE_WMMA_API)

#include "cutlass_unit_test.h"
#include "cutlass/gemm/gemm.h"
#include "cutlass/gemm/wmma_gemm_traits.h"
#include "tools/test/unit/gemm/gemm_testbed.h"
#include "tools/test/unit/gemm/run_gemm.h"

////////////////////////////////////////////////////////////////////////////////////////////////////

TEST(WmmaGemm_16x16x32_f16, wmma_gemm_36x36x16_nn) {
  /*
  this wmmaTraits requires leading dim to be divisible by 4
  */
  typedef cutlass::gemm::WmmaGemmTraits<
    cutlass::MatrixLayout::kColumnMajor,
    cutlass::MatrixLayout::kColumnMajor,
    cutlass::Shape<32, 16, 16>,
    half,
    half,
    half,
    cutlass::gemm::LinearScaling<half>,
    half,
    typename cutlass::gemm::WmmaGemmAccumulatorsPerWarp<typename cutlass::Shape<32, 16, 16> >::Shape,
    typename cutlass::Shape<16, 16, 16>,
    4, /*kScalarsPerLdgA_*/
    4, /*kScalarsPerLdgB_*/
    4, /*KScalarsPerLdsA_*/
    4, /*KScalarsPerLdsB_*/
    4 / sizeof(half), /*kScalarsPerLdgCAndStgD_*/
    4 / sizeof(half), /*kScalarsPerStsD_*/
    4 / sizeof(half)  /*kScalarsPerLdsD_*/
  >
    WmmaGemmTraits;

  run_gemm<WmmaGemmTraits>(36, 36, 64);
}

////////////////////////////////////////////////////////////////////////////////////////////////////

TEST(WmmaGemm_16x16x32_f16, wmma_gemm_36x36x16_nt) {
  /*
  this wmmaTraits requires leading dim to be divisible by 4
  */
  typedef cutlass::gemm::WmmaGemmTraits<
    cutlass::MatrixLayout::kColumnMajor,
    cutlass::MatrixLayout::kRowMajor,
    cutlass::Shape<32, 16, 16>,
    half,
    half,
    half,
    cutlass::gemm::LinearScaling<half>,
    half,
    typename cutlass::gemm::WmmaGemmAccumulatorsPerWarp<typename cutlass::Shape<32, 16, 16> >::Shape,
    typename cutlass::Shape<16, 16, 16>,
    4, /*kScalarsPerLdgA_*/
    4, /*kScalarsPerLdgB_*/
    4, /*KScalarsPerLdsA_*/
    4, /*KScalarsPerLdsB_*/
    4 / sizeof(half), /*kScalarsPerLdgCAndStgD_*/
    4 / sizeof(half), /*kScalarsPerStsD_*/
    4 / sizeof(half)  /*kScalarsPerLdsD_*/
  >
    WmmaGemmTraits;

  run_gemm<WmmaGemmTraits>(36, 36, 64);
}

////////////////////////////////////////////////////////////////////////////////////////////////////

TEST(WmmaGemm_16x16x32_f16, wmma_gemm_36x36x16_tn) {
  /*
  this wmmaTraits requires leading dim to be divisible by 4
  */
  typedef cutlass::gemm::WmmaGemmTraits<
    cutlass::MatrixLayout::kRowMajor,
    cutlass::MatrixLayout::kColumnMajor,
    cutlass::Shape<32, 16, 16>,
    half,
    half,
    half,
    cutlass::gemm::LinearScaling<half>,
    half,
    typename cutlass::gemm::WmmaGemmAccumulatorsPerWarp<typename cutlass::Shape<32, 16, 16> >::Shape,
    typename cutlass::Shape<16, 16, 16>,
    4, /*kScalarsPerLdgA_*/
    4, /*kScalarsPerLdgB_*/
    4, /*KScalarsPerLdsA_*/
    4, /*KScalarsPerLdsB_*/
    4 / sizeof(half), /*kScalarsPerLdgCAndStgD_*/
    4 / sizeof(half), /*kScalarsPerStsD_*/
    4 / sizeof(half)  /*kScalarsPerLdsD_*/
  >
    WmmaGemmTraits;

  run_gemm<WmmaGemmTraits>(36, 36, 64);
}

////////////////////////////////////////////////////////////////////////////////////////////////////

TEST(WmmaGemm_16x16x32_f16, wmma_gemm_36x36x16_tt) {
  /*
  this wmmaTraits requires leading dim to be divisible by 4
  */
  typedef cutlass::gemm::WmmaGemmTraits<
    cutlass::MatrixLayout::kRowMajor,
    cutlass::MatrixLayout::kRowMajor,
    cutlass::Shape<32, 16, 16>,
    half,
    half,
    half,
    cutlass::gemm::LinearScaling<half>,
    half,
    typename cutlass::gemm::WmmaGemmAccumulatorsPerWarp<typename cutlass::Shape<32, 16, 16> >::Shape,
    typename cutlass::Shape<16, 16, 16>,
    4, /*kScalarsPerLdgA_*/
    4, /*kScalarsPerLdgB_*/
    4, /*KScalarsPerLdsA_*/
    4, /*KScalarsPerLdsB_*/
    4 / sizeof(half), /*kScalarsPerLdgCAndStgD_*/
    4 / sizeof(half), /*kScalarsPerStsD_*/
    4 / sizeof(half)  /*kScalarsPerLdsD_*/
  >
    WmmaGemmTraits;

  run_gemm<WmmaGemmTraits>(36, 36, 64);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#endif
