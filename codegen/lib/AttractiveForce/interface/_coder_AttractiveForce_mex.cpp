//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_AttractiveForce_mex.cpp
//
// Code generation for function 'AttractiveForce'
//

// Include files
#include "_coder_AttractiveForce_mex.h"
#include "_coder_AttractiveForce_api.h"

// Function Definitions
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  mexAtExit(&AttractiveForce_atexit);
  // Module initialization.
  AttractiveForce_initialize();
  // Dispatch the entry-point.
  unsafe_AttractiveForce_mexFunction(nlhs, plhs, nrhs, prhs);
  // Module termination.
  AttractiveForce_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           nullptr, "UTF-8", true);
  return emlrtRootTLSGlobal;
}

void unsafe_AttractiveForce_mexFunction(int32_T nlhs, mxArray *plhs[1],
                                        int32_T nrhs, const mxArray *prhs[6])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  // Check for proper number of arguments.
  if (nrhs != 6) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 6, 4,
                        15, "AttractiveForce");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 15,
                        "AttractiveForce");
  }
  // Call the function.
  AttractiveForce_api(prhs, &outputs);
  // Copy over outputs to the caller.
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

// End of code generation (_coder_AttractiveForce_mex.cpp)
