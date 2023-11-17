//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// AttractiveForce.h
//
// Code generation for function 'AttractiveForce'
//

#ifndef ATTRACTIVEFORCE_H
#define ATTRACTIVEFORCE_H

// Include files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
extern void AttractiveForce(const double q[2], const double qd[2], double Katt,
                            double a, double b, double maxVel, double Fatt[2]);

#endif
// End of code generation (AttractiveForce.h)
