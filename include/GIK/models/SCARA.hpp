#pragma once
#include <GIK/common.hpp>
#include <GIK/denavit_hartenberg.hpp>
#include <vector>

namespace GIK
{
    Mat4 DH_SCARA(double th_1, double th_2, double alpha_2, double a_1, double a_2, double a_3, double a_4, double a_5, double d_3)
    {
        Mat4 T1 = DH(th_1, 0, a_2, a_1);
        Mat4 T2 = DH(th_2, alpha_2, a_4, a_3);
        Mat4 T3 = DH(0, 0, 0, a_5 + d_3);
        return T1 * T2 * T3;
    }
}