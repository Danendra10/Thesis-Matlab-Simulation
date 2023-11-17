//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_AttractiveForce_api.h
//
// Code generation for function 'AttractiveForce'
//

#ifndef _CODER_ATTRACTIVEFORCE_API_H
#define _CODER_ATTRACTIVEFORCE_API_H

// Include files
#include "emlrt.h"
#include "tmwtypes.h"
#include <algorithm>
#include <cstring>

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

// Function Declarations
void AttractiveForce(real_T q[2], real_T qd[2], real_T Katt, real_T a, real_T b,
                     real_T maxVel, real_T Fatt[2]);

void AttractiveForce_api(const mxArray *const prhs[6], const mxArray **plhs);

void AttractiveForce_atexit();

void AttractiveForce_initialize();

void AttractiveForce_terminate();

void AttractiveForce_xil_shutdown();

void AttractiveForce_xil_terminate();

#endif
// End of code generation (_coder_AttractiveForce_api.h)
