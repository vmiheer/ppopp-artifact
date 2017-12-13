#include <stdio.h>
#include "cuda.h"
#define max(x,y)  ((x) > (y)? (x) : (y))
#define min(x,y)  ((x) < (y)? (x) : (y))
#define ceil(a,b) ((a) % (b) == 0 ? (a) / (b) : ((a) / (b)) + 1)

void check_error (const char* message) {
	cudaError_t error = cudaGetLastError ();
	if (error != cudaSuccess) {
		printf ("CUDA error : %s, %s\n", message, cudaGetErrorString (error));
		exit(-1);
	}
}

__global__ void hypterm (double * __restrict__ flux_in_0, double * __restrict__ flux_in_1, double * __restrict__ flux_in_2, double * __restrict__ flux_in_3, double * __restrict__ flux_in_4, double * __restrict__ cons_in_1, double * __restrict__ cons_in_2, double * __restrict__ cons_in_3, double * __restrict__ cons_in_4, double * __restrict__ q_in_1, double * __restrict__ q_in_2, double * __restrict__ q_in_3, double * __restrict__ q_in_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
	//Determing the block's indices
	int blockdim_i= (int)(blockDim.x);
	int i0 = (int)(blockIdx.x)*(blockdim_i);
	int i = max (i0, 0) + (int)(threadIdx.x);
	int blockdim_j= (int)(blockDim.y);
	int j0 = (int)(blockIdx.y)*(blockdim_j);
	int j = max (j0, 0) + (int)(threadIdx.y);
	int blockdim_k= (int)(blockDim.z);
	int k0 = (int)(blockIdx.z)*(blockdim_k);
	int k = max (k0, 0) + (int)(threadIdx.z);

	double (*flux_0)[308][308] = (double (*)[308][308])flux_in_0;
	double (*flux_1)[308][308] = (double (*)[308][308])flux_in_1;
	double (*flux_2)[308][308] = (double (*)[308][308])flux_in_2;
	double (*flux_3)[308][308] = (double (*)[308][308])flux_in_3;
	double (*flux_4)[308][308] = (double (*)[308][308])flux_in_4;
	double (*q_1)[308][308] = (double (*)[308][308])q_in_1;
	double (*q_2)[308][308] = (double (*)[308][308])q_in_2;
	double (*q_3)[308][308] = (double (*)[308][308])q_in_3;
	double (*q_4)[308][308] = (double (*)[308][308])q_in_4;
	double (*cons_1)[308][308] = (double (*)[308][308])cons_in_1;
	double (*cons_2)[308][308] = (double (*)[308][308])cons_in_2;
	double (*cons_3)[308][308] = (double (*)[308][308])cons_in_3;
	double (*cons_4)[308][308] = (double (*)[308][308])cons_in_4;

	if (i>=4 & j>=4 & k>=4 & i<=N-5 & j<=N-5 & k<=N-5) {
double _t_1_ = cons_1[k][j][i+1];
_t_1_ -= cons_1[k][j][i-1];
double flux_0kc0jc0ic0 = dxinv0 * 0.8 * _t_1_;
double _t_2_ = cons_1[k][j][i+2];
_t_2_ -= cons_1[k][j][i-2];
flux_0kc0jc0ic0 -= dxinv0 * 0.2 * _t_2_;
double _t_3_ = cons_1[k][j][i+3];
_t_3_ -= cons_1[k][j][i-3];
flux_0kc0jc0ic0 += dxinv0 * 0.038 * _t_3_;
double _t_4_ = cons_1[k][j][i+4];
_t_4_ -= cons_1[k][j][i-4];
flux_0kc0jc0ic0 -= dxinv0 * 0.0035 * _t_4_;

double _t_6_ = cons_1[k][j][i+1] * q_1[k][j][i+1];
_t_6_ -= cons_1[k][j][i-1] * q_1[k][j][i-1];
_t_6_ += q_4[k][j][i+1];
_t_6_ -= q_4[k][j][i-1];
double flux_1kc0jc0ic0 = dxinv0 * 0.8 * _t_6_;
double _t_7_ = cons_1[k][j][i+2] * q_1[k][j][i+2];
_t_7_ -= cons_1[k][j][i-2] * q_1[k][j][i-2];
_t_7_ += q_4[k][j][i+2];
_t_7_ -= q_4[k][j][i-2];
flux_1kc0jc0ic0 -= dxinv0 * 0.2 * _t_7_;
double _t_8_ = cons_1[k][j][i+3] * q_1[k][j][i+3];
_t_8_ -= cons_1[k][j][i-3] * q_1[k][j][i-3];
_t_8_ += q_4[k][j][i+3];
_t_8_ -= q_4[k][j][i-3];
flux_1kc0jc0ic0 += dxinv0 * 0.038 * _t_8_;
double _t_9_ = cons_1[k][j][i+4] * q_1[k][j][i+4];
_t_9_ -= cons_1[k][j][i-4] * q_1[k][j][i-4];
_t_9_ += q_4[k][j][i+4];
_t_9_ -= q_4[k][j][i-4];
flux_1kc0jc0ic0 -= dxinv0 * 0.0035 * _t_9_;

double _t_11_ = cons_2[k][j][i+1] * q_1[k][j][i+1];
_t_11_ -= cons_2[k][j][i-1] * q_1[k][j][i-1];
double flux_2kc0jc0ic0 = dxinv0 * 0.8 * _t_11_;
double _t_12_ = cons_2[k][j][i+2] * q_1[k][j][i+2];
_t_12_ -= cons_2[k][j][i-2] * q_1[k][j][i-2];
flux_2kc0jc0ic0 -= dxinv0 * 0.2 * _t_12_;
double _t_13_ = cons_2[k][j][i+3] * q_1[k][j][i+3];
_t_13_ -= cons_2[k][j][i-3] * q_1[k][j][i-3];
flux_2kc0jc0ic0 += dxinv0 * 0.038 * _t_13_;
double _t_14_ = cons_2[k][j][i+4] * q_1[k][j][i+4];
_t_14_ -= cons_2[k][j][i-4] * q_1[k][j][i-4];
flux_2kc0jc0ic0 -= dxinv0 * 0.0035 * _t_14_;

double _t_16_ = cons_3[k][j][i+1] * q_1[k][j][i+1];
_t_16_ -= cons_3[k][j][i-1] * q_1[k][j][i-1];
double flux_3kc0jc0ic0 = dxinv0 * 0.8 * _t_16_;
double _t_17_ = cons_3[k][j][i+2] * q_1[k][j][i+2];
_t_17_ -= cons_3[k][j][i-2] * q_1[k][j][i-2];
flux_3kc0jc0ic0 -= dxinv0 * 0.2 * _t_17_;
double _t_18_ = cons_3[k][j][i+3] * q_1[k][j][i+3];
_t_18_ -= cons_3[k][j][i-3] * q_1[k][j][i-3];
flux_3kc0jc0ic0 += dxinv0 * 0.038 * _t_18_;
double _t_19_ = cons_3[k][j][i+4] * q_1[k][j][i+4];
_t_19_ -= cons_3[k][j][i-4] * q_1[k][j][i-4];
flux_3kc0jc0ic0 -= dxinv0 * 0.0035 * _t_19_;

double _t_21_ = q_4[k][j][i+1] * q_1[k][j][i+1];
double _v_24_ = cons_4[k][j][i+1] * q_1[k][j][i+1];
_t_21_ += _v_24_;
_t_21_ -= cons_4[k][j][i-1] * q_1[k][j][i-1];
double _v_27_ = q_4[k][j][i-1] * q_1[k][j][i-1];
_t_21_ -= _v_27_;
double flux_4kc0jc0ic0 = dxinv0 * 0.8 * _t_21_;
double _t_22_ = q_4[k][j][i+2] * q_1[k][j][i+2];
double _v_28_ = cons_4[k][j][i+2] * q_1[k][j][i+2];
_t_22_ += _v_28_;
_t_22_ -= cons_4[k][j][i-2] * q_1[k][j][i-2];
double _v_31_ = q_4[k][j][i-2] * q_1[k][j][i-2];
_t_22_ -= _v_31_;
flux_4kc0jc0ic0 -= dxinv0 * 0.2 * _t_22_;
double _t_23_ = q_4[k][j][i+3] * q_1[k][j][i+3];
double _v_32_ = cons_4[k][j][i+3] * q_1[k][j][i+3];
_t_23_ += _v_32_;
_t_23_ -= cons_4[k][j][i-3] * q_1[k][j][i-3];
double _v_35_ = q_4[k][j][i-3] * q_1[k][j][i-3];
_t_23_ -= _v_35_;
flux_4kc0jc0ic0 += dxinv0 * 0.038 * _t_23_;
double _t_24_ = q_4[k][j][i+4] * q_1[k][j][i+4];
double _v_36_ = cons_4[k][j][i+4] * q_1[k][j][i+4];
_t_24_ += _v_36_;
_t_24_ -= cons_4[k][j][i-4] * q_1[k][j][i-4];
double _v_39_ = q_4[k][j][i-4] * q_1[k][j][i-4];
_t_24_ -= _v_39_;
flux_4kc0jc0ic0 -= dxinv0 * 0.0035 * _t_24_;

double _t_27_ = cons_2[k][j+1][i];
_t_27_ -= cons_2[k][j-1][i];
double _t_25_ = dxinv1 * 0.8 * _t_27_;
double _t_28_ = cons_2[k][j+2][i];
_t_28_ -= cons_2[k][j-2][i];
_t_25_ -= dxinv1 * 0.2 * _t_28_;
double _t_29_ = cons_2[k][j+3][i];
_t_29_ -= cons_2[k][j-3][i];
_t_25_ += dxinv1 * 0.038 * _t_29_;
double _t_30_ = cons_2[k][j+4][i];
_t_30_ -= cons_2[k][j-4][i];
_t_25_ -= dxinv1 * 0.0035 * _t_30_;
flux_0kc0jc0ic0 -= _t_25_;

double _t_33_ = cons_1[k][j+1][i] * q_2[k][j+1][i];
_t_33_ -= cons_1[k][j-1][i] * q_2[k][j-1][i];
double _t_31_ = dxinv1 * 0.8 * _t_33_;
double _t_34_ = cons_1[k][j+2][i] * q_2[k][j+2][i];
_t_34_ -= cons_1[k][j-2][i] * q_2[k][j-2][i];
_t_31_ -= dxinv1 * 0.2 * _t_34_;
double _t_35_ = cons_1[k][j+3][i] * q_2[k][j+3][i];
_t_35_ -= cons_1[k][j-3][i] * q_2[k][j-3][i];
_t_31_ += dxinv1 * 0.038 * _t_35_;
double _t_36_ = cons_1[k][j+4][i] * q_2[k][j+4][i];
_t_36_ -= cons_1[k][j-4][i] * q_2[k][j-4][i];
_t_31_ -= dxinv1 * 0.0035 * _t_36_;
flux_1kc0jc0ic0 -= _t_31_;

double _t_39_ = cons_2[k][j+1][i] * q_2[k][j+1][i];
_t_39_ -= cons_2[k][j-1][i] * q_2[k][j-1][i];
_t_39_ += q_4[k][j+1][i];
_t_39_ -= q_4[k][j-1][i];
double _t_37_ = dxinv1 * 0.8 * _t_39_;
double _t_40_ = cons_2[k][j+2][i] * q_2[k][j+2][i];
_t_40_ -= cons_2[k][j-2][i] * q_2[k][j-2][i];
_t_40_ += q_4[k][j+2][i];
_t_40_ -= q_4[k][j-2][i];
_t_37_ -= dxinv1 * 0.2 * _t_40_;
double _t_41_ = cons_2[k][j+3][i] * q_2[k][j+3][i];
_t_41_ -= cons_2[k][j-3][i] * q_2[k][j-3][i];
_t_41_ += q_4[k][j+3][i];
_t_41_ -= q_4[k][j-3][i];
_t_37_ += dxinv1 * 0.038 * _t_41_;
double _t_42_ = cons_2[k][j+4][i] * q_2[k][j+4][i];
_t_42_ -= cons_2[k][j-4][i] * q_2[k][j-4][i];
_t_42_ += q_4[k][j+4][i];
_t_42_ -= q_4[k][j-4][i];
_t_37_ -= dxinv1 * 0.0035 * _t_42_;
flux_2kc0jc0ic0 -= _t_37_;

double _t_45_ = cons_3[k][j+1][i] * q_2[k][j+1][i];
_t_45_ -= cons_3[k][j-1][i] * q_2[k][j-1][i];
double _t_43_ = dxinv1 * 0.8 * _t_45_;
double _t_46_ = cons_3[k][j+2][i] * q_2[k][j+2][i];
_t_46_ -= cons_3[k][j-2][i] * q_2[k][j-2][i];
_t_43_ -= dxinv1 * 0.2 * _t_46_;
double _t_47_ = cons_3[k][j+3][i] * q_2[k][j+3][i];
_t_47_ -= cons_3[k][j-3][i] * q_2[k][j-3][i];
_t_43_ += dxinv1 * 0.038 * _t_47_;
double _t_48_ = cons_3[k][j+4][i] * q_2[k][j+4][i];
_t_48_ -= cons_3[k][j-4][i] * q_2[k][j-4][i];
_t_43_ -= dxinv1 * 0.0035 * _t_48_;
flux_3kc0jc0ic0 -= _t_43_;

double _t_51_ = q_4[k][j+1][i] * q_2[k][j+1][i];
double _v_64_ = cons_4[k][j+1][i] * q_2[k][j+1][i];
_t_51_ += _v_64_;
_t_51_ -= cons_4[k][j-1][i] * q_2[k][j-1][i];
double _v_67_ = q_4[k][j-1][i] * q_2[k][j-1][i];
_t_51_ -= _v_67_;
double _t_49_ = dxinv1 * 0.8 * _t_51_;
double _t_52_ = q_4[k][j+2][i] * q_2[k][j+2][i];
double _v_68_ = cons_4[k][j+2][i] * q_2[k][j+2][i];
_t_52_ += _v_68_;
_t_52_ -= cons_4[k][j-2][i] * q_2[k][j-2][i];
double _v_71_ = q_4[k][j-2][i] * q_2[k][j-2][i];
_t_52_ -= _v_71_;
_t_49_ -= dxinv1 * 0.2 * _t_52_;
double _t_53_ = q_4[k][j+3][i] * q_2[k][j+3][i];
double _v_72_ = cons_4[k][j+3][i] * q_2[k][j+3][i];
_t_53_ += _v_72_;
_t_53_ -= cons_4[k][j-3][i] * q_2[k][j-3][i];
double _v_75_ = q_4[k][j-3][i] * q_2[k][j-3][i];
_t_53_ -= _v_75_;
_t_49_ += dxinv1 * 0.038 * _t_53_;
double _t_54_ = q_4[k][j+4][i] * q_2[k][j+4][i];
double _v_76_ = cons_4[k][j+4][i] * q_2[k][j+4][i];
_t_54_ += _v_76_;
_t_54_ -= cons_4[k][j-4][i] * q_2[k][j-4][i];
double _v_79_ = q_4[k][j-4][i] * q_2[k][j-4][i];
_t_54_ -= _v_79_;
_t_49_ -= dxinv1 * 0.0035 * _t_54_;
flux_4kc0jc0ic0 -= _t_49_;

double _t_57_ = cons_3[k+1][j][i];
_t_57_ -= cons_3[k-1][j][i];
double _t_55_ = dxinv2 * 0.8 * _t_57_;
double _t_58_ = cons_3[k+2][j][i];
_t_58_ -= cons_3[k-2][j][i];
_t_55_ -= dxinv2 * 0.2 * _t_58_;
double _t_59_ = cons_3[k+3][j][i];
_t_59_ -= cons_3[k-3][j][i];
_t_55_ += dxinv2 * 0.038 * _t_59_;
double _t_60_ = cons_3[k+4][j][i];
_t_60_ -= cons_3[k-4][j][i];
_t_55_ -= dxinv2 * 0.0035 * _t_60_;
flux_0kc0jc0ic0 -= _t_55_;

double _t_63_ = cons_1[k+1][j][i] * q_3[k+1][j][i];
_t_63_ -= cons_1[k-1][j][i] * q_3[k-1][j][i];
double _t_61_ = dxinv2 * 0.8 * _t_63_;
double _t_64_ = cons_1[k+2][j][i] * q_3[k+2][j][i];
_t_64_ -= cons_1[k-2][j][i] * q_3[k-2][j][i];
_t_61_ -= dxinv2 * 0.2 * _t_64_;
double _t_65_ = cons_1[k+3][j][i] * q_3[k+3][j][i];
_t_65_ -= cons_1[k-3][j][i] * q_3[k-3][j][i];
_t_61_ += dxinv2 * 0.038 * _t_65_;
double _t_66_ = cons_1[k+4][j][i] * q_3[k+4][j][i];
_t_66_ -= cons_1[k-4][j][i] * q_3[k-4][j][i];
_t_61_ -= dxinv2 * 0.0035 * _t_66_;
flux_1kc0jc0ic0 -= _t_61_;

double _t_69_ = cons_2[k+1][j][i] * q_3[k+1][j][i];
_t_69_ -= cons_2[k-1][j][i] * q_3[k-1][j][i];
double _t_67_ = dxinv2 * 0.8 * _t_69_;
double _t_70_ = cons_2[k+2][j][i] * q_3[k+2][j][i];
_t_70_ -= cons_2[k-2][j][i] * q_3[k-2][j][i];
_t_67_ -= dxinv2 * 0.2 * _t_70_;
double _t_71_ = cons_2[k+3][j][i] * q_3[k+3][j][i];
_t_71_ -= cons_2[k-3][j][i] * q_3[k-3][j][i];
_t_67_ += dxinv2 * 0.038 * _t_71_;
double _t_72_ = cons_2[k+4][j][i] * q_3[k+4][j][i];
_t_72_ -= cons_2[k-4][j][i] * q_3[k-4][j][i];
_t_67_ -= dxinv2 * 0.0035 * _t_72_;
flux_2kc0jc0ic0 -= _t_67_;

double _t_75_ = cons_3[k+1][j][i] * q_3[k+1][j][i];
_t_75_ -= cons_3[k-1][j][i] * q_3[k-1][j][i];
_t_75_ += q_4[k+1][j][i];
_t_75_ -= q_4[k-1][j][i];
double _t_73_ = dxinv2 * 0.8 * _t_75_;
double _t_76_ = cons_3[k+2][j][i] * q_3[k+2][j][i];
_t_76_ -= cons_3[k-2][j][i] * q_3[k-2][j][i];
_t_76_ += q_4[k+2][j][i];
_t_76_ -= q_4[k-2][j][i];
_t_73_ -= dxinv2 * 0.2 * _t_76_;
double _t_77_ = cons_3[k+3][j][i] * q_3[k+3][j][i];
_t_77_ -= cons_3[k-3][j][i] * q_3[k-3][j][i];
_t_77_ += q_4[k+3][j][i];
_t_77_ -= q_4[k-3][j][i];
_t_73_ += dxinv2 * 0.038 * _t_77_;
double _t_78_ = cons_3[k+4][j][i] * q_3[k+4][j][i];
_t_78_ -= cons_3[k-4][j][i] * q_3[k-4][j][i];
_t_78_ += q_4[k+4][j][i];
_t_78_ -= q_4[k-4][j][i];
_t_73_ -= dxinv2 * 0.0035 * _t_78_;
flux_3kc0jc0ic0 -= _t_73_;

double _t_81_ = q_4[k+1][j][i] * q_3[k+1][j][i];
double _v_104_ = cons_4[k+1][j][i] * q_3[k+1][j][i];
_t_81_ += _v_104_;
_t_81_ -= cons_4[k-1][j][i] * q_3[k-1][j][i];
double _v_107_ = q_4[k-1][j][i] * q_3[k-1][j][i];
_t_81_ -= _v_107_;
double _t_79_ = dxinv2 * 0.8 * _t_81_;
double _t_82_ = q_4[k+2][j][i] * q_3[k+2][j][i];
double _v_108_ = cons_4[k+2][j][i] * q_3[k+2][j][i];
_t_82_ += _v_108_;
_t_82_ -= cons_4[k-2][j][i] * q_3[k-2][j][i];
double _v_111_ = q_4[k-2][j][i] * q_3[k-2][j][i];
_t_82_ -= _v_111_;
_t_79_ -= dxinv2 * 0.2 * _t_82_;
double _t_83_ = q_4[k+3][j][i] * q_3[k+3][j][i];
double _v_112_ = cons_4[k+3][j][i] * q_3[k+3][j][i];
_t_83_ += _v_112_;
_t_83_ -= cons_4[k-3][j][i] * q_3[k-3][j][i];
double _v_115_ = q_4[k-3][j][i] * q_3[k-3][j][i];
_t_83_ -= _v_115_;
_t_79_ += dxinv2 * 0.038 * _t_83_;
double _t_84_ = q_4[k+4][j][i] * q_3[k+4][j][i];
double _v_116_ = cons_4[k+4][j][i] * q_3[k+4][j][i];
_t_84_ += _v_116_;
_t_84_ -= cons_4[k-4][j][i] * q_3[k-4][j][i];
double _v_119_ = q_4[k-4][j][i] * q_3[k-4][j][i];
_t_84_ -= _v_119_;
_t_79_ -= dxinv2 * 0.0035 * _t_84_;
flux_4kc0jc0ic0 -= _t_79_;

flux_0[k][j][i] = flux_0kc0jc0ic0;
flux_1[k][j][i] = flux_1kc0jc0ic0;
flux_2[k][j][i] = flux_2kc0jc0ic0;
flux_3[k][j][i] = flux_3kc0jc0ic0;
flux_4[k][j][i] = flux_4kc0jc0ic0;
	} 
}

extern "C" void host_code (double *h_flux_0, double *h_flux_1, double *h_flux_2, double *h_flux_3, double *h_flux_4, double *h_cons_1, double *h_cons_2, double *h_cons_3, double *h_cons_4, double *h_q_1, double *h_q_2, double *h_q_3, double *h_q_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
	double *flux_0;
	cudaMalloc (&flux_0, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_0\n");
	cudaMemcpy (flux_0, h_flux_0, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_1;
	cudaMalloc (&flux_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_1\n");
	cudaMemcpy (flux_1, h_flux_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_2;
	cudaMalloc (&flux_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_2\n");
	cudaMemcpy (flux_2, h_flux_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_3;
	cudaMalloc (&flux_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_3\n");
	cudaMemcpy (flux_3, h_flux_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_4;
	cudaMalloc (&flux_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_4\n");
	cudaMemcpy (flux_4, h_flux_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_1;
	cudaMalloc (&cons_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_1\n");
	cudaMemcpy (cons_1, h_cons_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_2;
	cudaMalloc (&cons_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_2\n");
	cudaMemcpy (cons_2, h_cons_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_3;
	cudaMalloc (&cons_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_3\n");
	cudaMemcpy (cons_3, h_cons_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_4;
	cudaMalloc (&cons_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_4\n");
	cudaMemcpy (cons_4, h_cons_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_1;
	cudaMalloc (&q_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_1\n");
	cudaMemcpy (q_1, h_q_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_2;
	cudaMalloc (&q_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_2\n");
	cudaMemcpy (q_2, h_q_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_3;
	cudaMalloc (&q_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_3\n");
	cudaMemcpy (q_3, h_q_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_4;
	cudaMalloc (&q_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_4\n");
	cudaMemcpy (q_4, h_q_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);

	dim3 blockconfig (16, 4, 4);
	dim3 gridconfig (ceil(N, blockconfig.x), ceil(M, blockconfig.y), ceil(L, blockconfig.z));
	hypterm <<<gridconfig, blockconfig>>> (flux_0, flux_1, flux_2, flux_3, flux_4, cons_1, cons_2, cons_3, cons_4, q_1, q_2, q_3, q_4, -dxinv0, dxinv1, dxinv2, L, M, N);

	cudaMemcpy (h_flux_0, flux_0, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_1, flux_1, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_3, flux_3, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_4, flux_4, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_2, flux_2, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
}
