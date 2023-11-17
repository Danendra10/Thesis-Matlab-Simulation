//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_AttractiveForce_api.cpp
//
// Code generation for function 'AttractiveForce'
//

// Include files
#include "_coder_AttractiveForce_api.h"
#include "_coder_AttractiveForce_mex.h"

// Variable Definitions
emlrtCTX emlrtRootTLSGlobal{nullptr};

emlrtContext emlrtContextGlobal{
    true,                                                 // bFirstTime
    false,                                                // bInitialized
    131627U,                                              // fVersionInfo
    nullptr,                                              // fErrorFunction
    "AttractiveForce",                                    // fFunctionName
    nullptr,                                              // fRTCallStack
    false,                                                // bDebugMode
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, // fSigWrd
    nullptr                                               // fSigMem
};

// Function Declarations
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Katt,
                                 const char_T *identifier);

static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[2];

static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *q,
                                 const char_T *identifier))[2];

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[2];

static const mxArray *emlrt_marshallOut(const real_T u[2]);

// Function Definitions
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Katt,
                                 const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(Katt), &thisId);
  emlrtDestroyArray(&Katt);
  return y;
}

static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = d_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[2]
{
  static const int32_T dims{2};
  real_T(*ret)[2];
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 1U,
                          (const void *)&dims);
  ret = (real_T(*)[2])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims{0};
  real_T ret;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 0U,
                          (const void *)&dims);
  ret = *static_cast<real_T *>(emlrtMxGetData(src));
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *q,
                                 const char_T *identifier))[2]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[2];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(sp, emlrtAlias(q), &thisId);
  emlrtDestroyArray(&q);
  return y;
}

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[2]
{
  real_T(*y)[2];
  y = c_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[2])
{
  static const int32_T i{0};
  static const int32_T i1{2};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(1, (const void *)&i, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &i1, 1);
  emlrtAssign(&y, m);
  return y;
}

void AttractiveForce_api(const mxArray *const prhs[6], const mxArray **plhs)
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  real_T(*Fatt)[2];
  real_T(*q)[2];
  real_T(*qd)[2];
  real_T Katt;
  real_T a;
  real_T b;
  real_T maxVel;
  st.tls = emlrtRootTLSGlobal;
  Fatt = (real_T(*)[2])mxMalloc(sizeof(real_T[2]));
  // Marshall function inputs
  q = emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "q");
  qd = emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "qd");
  Katt = b_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "Katt");
  a = b_emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "a");
  b = b_emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "b");
  maxVel = b_emlrt_marshallIn(&st, emlrtAliasP(prhs[5]), "maxVel");
  // Invoke the target function
  AttractiveForce(*q, *qd, Katt, a, b, maxVel, *Fatt);
  // Marshall function outputs
  *plhs = emlrt_marshallOut(*Fatt);
}

void AttractiveForce_atexit()
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  AttractiveForce_xil_terminate();
  AttractiveForce_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void AttractiveForce_initialize()
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

void AttractiveForce_terminate()
{
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

// End of code generation (_coder_AttractiveForce_api.cpp)
