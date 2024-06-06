#pragma once
#include <GIK/common.hpp>

namespace GIK
{
    struct DH_Params
    {
        double a;
        double alpha;
        double d;
        double theta;
    };

    Mat4 DH(double theta, double alpha, double a, double d)
    {
        Mat4 T;
        T << cos(theta), -sin(theta), 0, a,
             sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -sin(alpha)*d,
             sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha), cos(alpha)*d,
             0, 0, 0, 1;
        return T;
    }
    Mat4 DH(DH_Params params)
    {
        return DH(params.a, params.alpha, params.d, params.theta);
    }
}