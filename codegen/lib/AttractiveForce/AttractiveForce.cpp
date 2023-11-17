//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// AttractiveForce.cpp
//
// Code generation for function 'AttractiveForce'
//

// Include files
#include "AttractiveForce.h"
#include <cmath>

// Function Definitions
void AttractiveForce(const double q[2], const double qd[2], double Katt,
                     double a, double b, double maxVel, double Fatt[2])
{
  double a_tmp;
  double grad_dir_y;
  //  AttractiveForce - Calculates the attractive force between a current
  //  position q and a goal position qd
  //
  //  Syntax:
  //     Fatt = AttractiveForce(q, qd, Katt, a, b, maxVel)
  //
  //  Inputs:
  //     q - Current position (2D vector)
  //     qd - Goal position (2D vector)
  //     Katt - Attractive force gain
  //     a - Parabolic curvature of the attractive potential
  //     b - Parabolic curvature of the attractive potential
  //     maxVel - Maximum velocity or force magnitude to apply
  //
  //  Output:
  //     Fatt - Attractive force (2D vector)
  //
  //  Example:
  //     Fatt = AttractiveForce([0; 0], [10; 10], 1, 1, 1, 100)
  //
  //  Other m-files required: None
  //  Subfunctions: None
  //  MAT-files required: None
  //
  //  See also: RepulsiveForce
  grad_dir_y = q[0] - qd[0];
  a_tmp = q[1] - qd[1];
  if (std::sqrt(grad_dir_y * grad_dir_y + a_tmp * a_tmp) < 75.0) {
    //  Compute the gradient of the paraboloid potential at point q with the
    //  goal at qd Since force is the negative gradient of the potential, we
    //  invert the sign of the calculated gradient. Combine the individual
    //  components to create the vector force.
    Fatt[0] = -(Katt * grad_dir_y / (a * a));
    Fatt[1] = -(Katt * a_tmp / (b * b));
  } else {
    double grad_dir_x;
    //  Assuming q and qd are the current and destination positions
    //  respectively, and maxVel is the maximum velocity or force magnitude you
    //  want to apply. Calculate the direction of the gradient. Note that the
    //  original code may result in a division by zero if q(i) equals qd(i). So,
    //  we handle the case where the difference is zero.
    if (q[0] == qd[0]) {
      grad_dir_x = 0.0;
    } else {
      grad_dir_x = grad_dir_y / std::abs(grad_dir_y);
    }
    if (q[1] == qd[1]) {
      grad_dir_y = 0.0;
    } else {
      grad_dir_y = a_tmp / std::abs(a_tmp);
    }
    //  Calculate the attractive force components.
    //  The force is negative of the gradient of the potential field.
    //  Combine the components to create the vector force.
    Fatt[0] = -Katt * grad_dir_x * maxVel / (a * a);
    Fatt[1] = -Katt * grad_dir_y * maxVel / (b * b);
  }
}

// End of code generation (AttractiveForce.cpp)
