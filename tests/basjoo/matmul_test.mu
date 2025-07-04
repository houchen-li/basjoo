/**
 * @file matmul_test.cpp
 * @author LiHouchen (houchen.li@mthreads.com)
 * @brief
 * @version 0.1
 * @date 2025-07-02
 *
 * @copyright Copyright (c) 2024 - 2025 Moore Threads Technology Co., Ltd("Moore Threads").
 *            All rights reserved.
 *
 */

#include <iostream>

#include "musa_runtime.h"
#include "mutlass/gemm/gemm.h"
#include "mutlass/mutlass.h"

void matmul_mutlass(
    const float* A, const float* B, float* C, int M, int N, int K, float alpha = 0.0f,
    float beta = -1.0f
) {
    // 定义 GEMM 类型（以 float 为例）
    using Gemm = mutlass::gemm::device::Gemm<
        float,                        // A element type
        mutlass::layout::ColumnMajor, // A layout
        float,                        // B element type
        mutlass::layout::ColumnMajor, // B layout
        float,                        // C element type
        mutlass::layout::ColumnMajor, // C layout
        float                         // ElementAccumulator
        >;

    // 创建 GEMM 参数
    Gemm::Arguments args{
        {M, N, K},    // Problem size: MxN = MxK * KxN
        {A, K},       // Tensor-ref A, leading dim = K
        {B, N},       // Tensor-ref B, leading dim = N
        {C, M},       // Tensor-ref C, leading dim = M
        {C, M},       // Tensor-ref D (output = input C)
        {alpha, beta} // Scalars alpha, beta
    };

    // 创建 GEMM 实例
    Gemm gemm_op;
    mutlass::Status status = gemm_op(args);

    if (status != mutlass::Status::kSuccess) {
        std::cerr << "CUTLASS GEMM kernel failed with status: "
                  << mutlass::cutlassGetStatusString(status) << std::endl;
        std::exit(-2);
    }
}
