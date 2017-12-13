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

__global__ void curvi (double * __restrict__ in_r1, double *__restrict__ in_u1, double * __restrict__ in_u2, double *__restrict__ in_u3, double * __restrict__ in_mu, double * __restrict__ in_la, double * __restrict__ in_met1, double * __restrict__ in_met2, double * __restrict__ in_met3, double * __restrict__ in_met4, double * strx, double * stry, double c1, double c2, int N) {
	//Determing the block's indices
	int blockdim_k= (int)(blockDim.x);
	int k0 = (int)(blockIdx.x)*(blockdim_k);
	int k = max (k0, 0) + (int)(threadIdx.x);
	int blockdim_j= (int)(blockDim.y);
	int j0 = (int)(blockIdx.y)*(blockdim_j);
	int j = max (j0, 0) + (int)(threadIdx.y);

	double (*u1)[304][304] = (double (*)[304][304])in_u1;
	double (*u2)[304][304] = (double (*)[304][304])in_u2;
	double (*u3)[304][304] = (double (*)[304][304])in_u3;
	double (*mu)[304][304] = (double (*)[304][304])in_mu;
	double (*la)[304][304] = (double (*)[304][304])in_la;
	double (*r1)[304][304] = (double (*)[304][304])in_r1;
	double (*met1)[304][304] = (double (*)[304][304])in_met1;
	double (*met2)[304][304] = (double (*)[304][304])in_met2;
	double (*met3)[304][304] = (double (*)[304][304])in_met3;
	double (*met4)[304][304] = (double (*)[304][304])in_met4;

	if (j>=2 & k>=2 & j<=N-3 & k<=N-3) {
		for (int i=2; i<=N-3; i++) {
double _t_86_ = 2.0 * mu[i+2][j][k];
_t_86_ += la[i+2][j][k];
double _t_83_ = met1[i+2][j][k] * _t_86_ * met2[i+2][j][k];
double _v_38_ = c2 * u1[i+2][j][k+2];
double _v_0_ = c2 * u1[i+2][j][k+2];
double _v_76_ = c2 * u1[i][j+2][k+2];
_v_76_ -= c2 * u1[i][j-2][k+2];
double _v_79_ = c2 * u2[i][j+2][k+2];
_v_79_ -= c2 * u2[i][j-2][k+2];
double _v_82_ = c2 * u1[i][j+2][k-2];
_v_82_ -= c2 * u1[i][j-2][k-2];
double _v_85_ = c2 * u2[i][j+2][k-2];
_v_85_ -= c2 * u2[i][j-2][k-2];
double _v_89_ = c2 * u1[i][j+2][k+1];
_v_89_ -= c2 * u1[i][j-2][k+1];
double _v_92_ = c2 * u2[i][j+2][k+1];
_v_92_ -= c2 * u2[i][j-2][k+1];
double _v_95_ = c2 * u1[i][j+2][k-1];
_v_95_ -= c2 * u1[i][j-2][k-1];
double _v_98_ = c2 * u2[i][j+2][k-1];
_v_98_ -= c2 * u2[i][j-2][k-1];
_v_38_ -= c2 * u1[i+2][j][k-2];
double _v_9_ = c2 * u1[i+2][j][k-2];
double _t_84_ = _v_38_;
double _v_39_ = c1 * u1[i+2][j][k+1];
double _v_77_ = c1 * u1[i][j+1][k+2];
_v_77_ -= c1 * u1[i][j-1][k+2];
double _v_80_ = c1 * u2[i][j+1][k+2];
_v_80_ -= c1 * u2[i][j-1][k+2];
double _v_83_ = c1 * u1[i][j+1][k-2];
_v_83_ -= c1 * u1[i][j-1][k-2];
double _v_86_ = c1 * u2[i][j+1][k-2];
_v_86_ -= c1 * u2[i][j-1][k-2];
double _v_90_ = c1 * u1[i][j+1][k+1];
_v_90_ -= c1 * u1[i][j-1][k+1];
double _v_93_ = c1 * u2[i][j+1][k+1];
_v_93_ -= c1 * u2[i][j-1][k+1];
double _v_96_ = c1 * u1[i][j+1][k-1];
_v_96_ -= c1 * u1[i][j-1][k-1];
double _v_99_ = c1 * u2[i][j+1][k-1];
_v_99_ -= c1 * u2[i][j-1][k-1];
_v_39_ -= c1 * u1[i+2][j][k-1];
_t_84_ += _v_39_;
double _v_40_ = strx[i] * _t_83_ * _t_84_;
double _v_19_ = c2 * u1[i+2][j][k+1];
double _v_28_ = c2 * u1[i+2][j][k-1];
double _v_56_ = c2 * _v_40_;
double _v_41_ = c2 * u2[i+2][j][k+2];
double _v_3_ = c2 * u2[i+2][j][k+2];
_v_41_ -= c2 * u2[i+2][j][k-2];
double _v_12_ = c2 * u2[i+2][j][k-2];
double _t_91_ = _v_41_;
double _v_42_ = c1 * u2[i+2][j][k+1];
_v_42_ -= c1 * u2[i+2][j][k-1];
_t_91_ += _v_42_;
double _t_90_ = met1[i+2][j][k] * la[i+2][j][k] * met3[i+2][j][k];
double _v_43_ = stry[j] * _t_90_ * _t_91_;
double _v_22_ = c2 * u2[i+2][j][k+1];
double _v_31_ = c2 * u2[i+2][j][k-1];
_v_56_ += c2 * _v_43_;
double _t_95_ = met1[i+2][j][k] * la[i+2][j][k] * met4[i+2][j][k];
double _v_44_ = c2 * u3[i+2][j][k+2];
double _v_6_ = c2 * u3[i+2][j][k+2];
_v_44_ -= c2 * u3[i+2][j][k-2];
double _v_15_ = c2 * u3[i+2][j][k-2];
double _t_96_ = _v_44_;
double _v_45_ = c1 * u3[i+2][j][k+1];
_v_45_ -= c1 * u3[i+2][j][k-1];
_t_96_ += _v_45_;
double _v_46_ = _t_95_ * _t_96_;
double _v_25_ = c2 * u3[i+2][j][k+1];
double _v_34_ = c2 * u3[i+2][j][k-1];
_v_56_ += c2 * _v_46_;
double _t_104_ = 2.0 * mu[i-2][j][k];
_t_104_ += la[i-2][j][k];
double _t_101_ = met1[i-2][j][k] * _t_104_ * met2[i-2][j][k];
double _v_47_ = c2 * u1[i-2][j][k+2];
_v_0_ -= c2 * u1[i-2][j][k+2];
_v_47_ -= c2 * u1[i-2][j][k-2];
_v_9_ -= c2 * u1[i-2][j][k-2];
double _t_102_ = _v_47_;
double _v_48_ = c1 * u1[i-2][j][k+1];
_v_48_ -= c1 * u1[i-2][j][k-1];
_t_102_ += _v_48_;
double _v_49_ = strx[i] * _t_101_ * _t_102_;
_v_19_ -= c2 * u1[i-2][j][k+1];
_v_28_ -= c2 * u1[i-2][j][k-1];
_v_56_ += c2 * _v_49_;
double _v_50_ = c2 * u2[i-2][j][k+2];
_v_3_ -= c2 * u2[i-2][j][k+2];
_v_50_ -= c2 * u2[i-2][j][k-2];
_v_12_ -= c2 * u2[i-2][j][k-2];
double _t_109_ = _v_50_;
double _v_51_ = c1 * u2[i-2][j][k+1];
_v_51_ -= c1 * u2[i-2][j][k-1];
_t_109_ += _v_51_;
double _t_108_ = met1[i-2][j][k] * la[i-2][j][k] * met3[i-2][j][k];
double _v_52_ = stry[j] * _t_108_ * _t_109_;
_v_22_ -= c2 * u2[i-2][j][k+1];
_v_31_ -= c2 * u2[i-2][j][k-1];
_v_56_ += c2 * _v_52_;
double _t_113_ = met1[i-2][j][k] * la[i-2][j][k] * met4[i-2][j][k];
double _v_53_ = c2 * u3[i-2][j][k+2];
_v_6_ -= c2 * u3[i-2][j][k+2];
_v_53_ -= c2 * u3[i-2][j][k-2];
_v_15_ -= c2 * u3[i-2][j][k-2];
double _t_114_ = _v_53_;
double _v_54_ = c1 * u3[i-2][j][k+1];
_v_54_ -= c1 * u3[i-2][j][k-1];
_t_114_ += _v_54_;
double _v_55_ = _t_113_ * _t_114_;
_v_25_ -= c2 * u3[i-2][j][k+1];
_v_34_ -= c2 * u3[i-2][j][k-1];
_v_56_ += c2 * _v_55_;
double _t_79_ = stry[j] * _v_56_;
double _t_123_ = 2.0 * mu[i+1][j][k];
_t_123_ += la[i+1][j][k];
double _t_120_ = met1[i+1][j][k] * _t_123_ * met2[i+1][j][k];
double _v_57_ = c2 * u1[i+1][j][k+2];
_v_57_ -= c2 * u1[i+1][j][k-2];
double _t_121_ = _v_57_;
double _v_58_ = c1 * u1[i+1][j][k+1];
double _v_20_ = c1 * u1[i+1][j][k+1];
_v_58_ -= c1 * u1[i+1][j][k-1];
double _v_29_ = c1 * u1[i+1][j][k-1];
_t_121_ += _v_58_;
double _v_59_ = strx[i] * _t_120_ * _t_121_;
double _v_1_ = c1 * u1[i+1][j][k+2];
double _v_10_ = c1 * u1[i+1][j][k-2];
double _v_75_ = c1 * _v_59_;
double _v_60_ = c2 * u2[i+1][j][k+2];
_v_60_ -= c2 * u2[i+1][j][k-2];
double _t_128_ = _v_60_;
double _v_61_ = c1 * u2[i+1][j][k+1];
double _v_23_ = c1 * u2[i+1][j][k+1];
_v_61_ -= c1 * u2[i+1][j][k-1];
double _v_32_ = c1 * u2[i+1][j][k-1];
_t_128_ += _v_61_;
double _t_127_ = met1[i+1][j][k] * la[i+1][j][k] * met3[i+1][j][k];
double _v_62_ = stry[j] * _t_127_ * _t_128_;
double _v_4_ = c1 * u2[i+1][j][k+2];
double _v_13_ = c1 * u2[i+1][j][k-2];
_v_75_ += c1 * _v_62_;
double _t_132_ = met1[i+1][j][k] * la[i+1][j][k] * met4[i+1][j][k];
double _v_63_ = c2 * u3[i+1][j][k+2];
_v_63_ -= c2 * u3[i+1][j][k-2];
double _t_133_ = _v_63_;
double _v_64_ = c1 * u3[i+1][j][k+1];
double _v_26_ = c1 * u3[i+1][j][k+1];
_v_64_ -= c1 * u3[i+1][j][k-1];
double _v_35_ = c1 * u3[i+1][j][k-1];
_t_133_ += _v_64_;
double _v_65_ = _t_132_ * _t_133_;
double _v_7_ = c1 * u3[i+1][j][k+2];
double _v_16_ = c1 * u3[i+1][j][k-2];
_v_75_ += c1 * _v_65_;
double _t_141_ = 2.0 * mu[i-1][j][k];
_t_141_ += la[i-1][j][k];
double _t_138_ = met1[i-1][j][k] * _t_141_ * met2[i-1][j][k];
double _v_66_ = c2 * u1[i-1][j][k+2];
_v_66_ -= c2 * u1[i-1][j][k-2];
double _t_139_ = _v_66_;
double _v_67_ = c1 * u1[i-1][j][k+1];
_v_20_ -= c1 * u1[i-1][j][k+1];
_v_67_ -= c1 * u1[i-1][j][k-1];
_v_29_ -= c1 * u1[i-1][j][k-1];
_t_139_ += _v_67_;
double _v_68_ = strx[i] * _t_138_ * _t_139_;
_v_1_ -= c1 * u1[i-1][j][k+2];
_v_10_ -= c1 * u1[i-1][j][k-2];
_v_75_ += c1 * _v_68_;
double _v_69_ = c2 * u2[i-1][j][k+2];
_v_69_ -= c2 * u2[i-1][j][k-2];
double _t_146_ = _v_69_;
double _v_70_ = c1 * u2[i-1][j][k+1];
_v_23_ -= c1 * u2[i-1][j][k+1];
_v_70_ -= c1 * u2[i-1][j][k-1];
_v_32_ -= c1 * u2[i-1][j][k-1];
_t_146_ += _v_70_;
double _t_145_ = met1[i-1][j][k] * la[i-1][j][k] * met3[i-1][j][k];
double _v_71_ = stry[j] * _t_145_ * _t_146_;
_v_4_ -= c1 * u2[i-1][j][k+2];
_v_13_ -= c1 * u2[i-1][j][k-2];
_v_75_ += c1 * _v_71_;
double _t_150_ = met1[i-1][j][k] * la[i-1][j][k] * met4[i-1][j][k];
double _v_72_ = c2 * u3[i-1][j][k+2];
_v_72_ -= c2 * u3[i-1][j][k-2];
double _t_151_ = _v_72_;
double _v_73_ = c1 * u3[i-1][j][k+1];
_v_26_ -= c1 * u3[i-1][j][k+1];
_v_73_ -= c1 * u3[i-1][j][k-1];
_v_35_ -= c1 * u3[i-1][j][k-1];
_t_151_ += _v_73_;
double _v_74_ = _t_150_ * _t_151_;
_v_7_ -= c1 * u3[i-1][j][k+2];
_v_16_ -= c1 * u3[i-1][j][k-2];
_v_75_ += c1 * _v_74_;
_t_79_ += stry[j] * _v_75_;
double r1ic0jc0kc0 = r1[i][j][k];
r1ic0jc0kc0 += _t_79_;

double _t_17_ = _v_6_;
_t_17_ += _v_7_;
double _t_16_ = met1[i][j][k+2] * mu[i][j][k+2] * met4[i][j][k+2];
double _v_8_ = stry[j] * _t_16_ * _t_17_;
double _v_18_ = c2 * _v_8_;
double _t_5_ = _v_0_;
_t_5_ += _v_1_;
double _t_7_ = 2.0 * mu[i][j][k+2];
double _t_10_ = met1[i][j][k+2] * mu[i][j][k+2] * met3[i][j][k+2];
_t_7_ += la[i][j][k+2];
double _t_4_ = met1[i][j][k+2] * _t_7_ * met2[i][j][k+2];
double _t_164_ = met1[i][j][k+2] * la[i][j][k+2] * met2[i][j][k+2];
double _t_3_ = _t_4_ * _t_5_;
double _v_2_ = stry[j] * _t_3_ * strx[i];
_v_18_ += c2 * _v_2_;
double _t_11_ = _v_3_;
_t_11_ += _v_4_;
double _v_5_ = _t_10_ * _t_11_;
_v_18_ += c2 * _v_5_;
double _t_24_ = _v_9_;
_t_24_ += _v_10_;
double _t_26_ = 2.0 * mu[i][j][k-2];
_t_26_ += la[i][j][k-2];
double _t_23_ = met1[i][j][k-2] * _t_26_ * met2[i][j][k-2];
double _t_176_ = met1[i][j][k-2] * la[i][j][k-2] * met2[i][j][k-2];
double _t_22_ = _t_23_ * _t_24_;
double _v_11_ = stry[j] * _t_22_ * strx[i];
_v_18_ += c2 * _v_11_;
double _t_30_ = _v_12_;
_t_30_ += _v_13_;
double _t_29_ = met1[i][j][k-2] * mu[i][j][k-2] * met3[i][j][k-2];
double _t_35_ = met1[i][j][k-2] * mu[i][j][k-2] * met4[i][j][k-2];
double _v_14_ = _t_29_ * _t_30_;
_v_18_ += c2 * _v_14_;
double _t_36_ = _v_15_;
_t_36_ += _v_16_;
double _v_17_ = stry[j] * _t_35_ * _t_36_;
_v_18_ += c2 * _v_17_;
double _t_0_ = _v_18_;
double _t_56_ = _v_25_;
_t_56_ += _v_26_;
double _t_55_ = met1[i][j][k+1] * mu[i][j][k+1] * met4[i][j][k+1];
double _v_27_ = stry[j] * _t_55_ * _t_56_;
double _v_37_ = c1 * _v_27_;
double _t_44_ = _v_19_;
_t_44_ += _v_20_;
double _t_46_ = 2.0 * mu[i][j][k+1];
double _t_49_ = met1[i][j][k+1] * mu[i][j][k+1] * met3[i][j][k+1];
_t_46_ += la[i][j][k+1];
double _t_43_ = met1[i][j][k+1] * _t_46_ * met2[i][j][k+1];
double _t_189_ = met1[i][j][k+1] * la[i][j][k+1] * met2[i][j][k+1];
double _t_42_ = _t_43_ * _t_44_;
double _v_21_ = stry[j] * _t_42_ * strx[i+2];
_v_37_ += c1 * _v_21_;
double _t_50_ = _v_22_;
_t_50_ += _v_23_;
double _v_24_ = _t_49_ * _t_50_;
_v_37_ += c1 * _v_24_;
double _t_63_ = _v_28_;
_t_63_ += _v_29_;
double _t_65_ = 2.0 * mu[i][j][k-1];
_t_65_ += la[i][j][k-1];
double _t_62_ = met1[i][j][k-1] * _t_65_ * met2[i][j][k-1];
double _t_201_ = met1[i][j][k-1] * la[i][j][k-1] * met2[i][j][k-1];
double _t_61_ = _t_62_ * _t_63_;
double _v_30_ = stry[j] * _t_61_ * strx[i-2];
_v_37_ += c1 * _v_30_;
double _t_69_ = _v_31_;
_t_69_ += _v_32_;
double _t_68_ = met1[i][j][k-1] * mu[i][j][k-1] * met3[i][j][k-1];
double _t_74_ = met1[i][j][k-1] * mu[i][j][k-1] * met4[i][j][k-1];
double _v_33_ = _t_68_ * _t_69_;
_v_37_ += c1 * _v_33_;
double _t_75_ = _v_34_;
_t_75_ += _v_35_;
double _v_36_ = stry[j] * _t_74_ * _t_75_;
_v_37_ += c1 * _v_36_;
_t_0_ += _v_37_;
r1ic0jc0kc0 += _t_0_;

double _t_159_ = _t_10_;
double _t_160_ = _v_76_;
_t_160_ += _v_77_;
double _t_158_ = _t_159_ * _t_160_;
double _v_78_ = strx[i] * _t_158_ * stry[j+2];
double _v_88_ = c2 * _v_78_;
double _t_165_ = _v_79_;
_t_165_ += _v_80_;
double _v_81_ = _t_164_ * _t_165_;
_v_88_ += c2 * _v_81_;
double _t_171_ = _t_29_;
double _t_172_ = _v_82_;
_t_172_ += _v_83_;
double _t_170_ = _t_171_ * _t_172_;
double _v_84_ = strx[i] * _t_170_ * stry[j];
_v_88_ += c2 * _v_84_;
double _t_177_ = _v_85_;
_t_177_ += _v_86_;
double _v_87_ = _t_176_ * _t_177_;
_v_88_ += c2 * _v_87_;
double _t_155_ = _v_88_;
double _t_184_ = _t_49_;
double _t_185_ = _v_89_;
_t_185_ += _v_90_;
double _t_183_ = _t_184_ * _t_185_;
double _v_91_ = strx[i] * _t_183_ * stry[j-2];
double _v_101_ = c1 * _v_91_;
double _t_190_ = _v_92_;
_t_190_ += _v_93_;
double _v_94_ = _t_189_ * _t_190_;
_v_101_ += c1 * _v_94_;
double _t_196_ = _t_68_;
double _t_197_ = _v_95_;
_t_197_ += _v_96_;
double _t_195_ = _t_196_ * _t_197_;
double _v_97_ = strx[i] * _t_195_ * stry[j];
_v_101_ += c1 * _v_97_;
double _t_202_ = _v_98_;
_t_202_ += _v_99_;
double _v_100_ = _t_201_ * _t_202_;
_v_101_ += c1 * _v_100_;
_t_155_ += _v_101_;
r1ic0jc0kc0 += _t_155_;

r1[i][j][k] = r1ic0jc0kc0;

			r1[i][j][k] += c2*(
					mu[i][j+2][k]*met3[i][j+2][k]*met1[i][j+2][k]*(
						c2*(u1[i][j+2][k+2]-u1[i][j+2][k-2]) +
						c1*(u1[i][j+2][k+1]-u1[i][j+2][k-1])   )*stry[j+1]*strx[i]
					+ mu[i][j+2][k]*met2[i][j+2][k]*met1[i][j+2][k]*(
						c2*(u2[i][j+2][k+2]-u2[i][j+2][k-2]) +
						c1*(u2[i][j+2][k+1]-u2[i][j+2][k-1])  )
					+ ( mu[i][j-2][k]*met3[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u1[i][j-2][k+2]-u1[i][j-2][k-2]) +
							c1*(u1[i][j-2][k+1]-u1[i][j-2][k-1])  )*stry[j]*strx[i]
						+ mu[i][j-2][k]*met2[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u2[i][j-2][k+2]-u2[i][j-2][k-2]) +
							c1*(u2[i][j-2][k+1]-u2[i][j-2][k-1])   ) )
					) + c1*(
						mu[i][j+1][k]*met3[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u1[i][j+1][k+2]-u1[i][j+1][k-2]) +
							c1*(u1[i][j+1][k+1]-u1[i][j+1][k-1]) )*stry[j-1]*strx[i]
						+ mu[i][j+1][k]*met2[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u2[i][j+1][k+2]-u2[i][j+1][k-2]) +
							c1*(u2[i][j+1][k+1]-u2[i][j+1][k-1]) )
						+ ( mu[i][j-1][k]*met3[i][j-1][k]*met1[i][j-1][k]*(
								c2*(u1[i][j-1][k+2]-u1[i][j-1][k-2]) +
								c1*(u1[i][j-1][k+1]-u1[i][j-1][k-1]) )*stry[j]*strx[i]
							+ mu[i][j-1][k]*met2[i][j-1][k]*met1[i][j-1][k]*(
								c2*(u2[i][j-1][k+2]-u2[i][j-1][k-2]) +
								c1*(u2[i][j-1][k+1]-u2[i][j-1][k-1]) ) ) );

			r1[i][j][k] +=
				c2*(  mu[i][j+2][k]*met1[i][j+2][k]*met1[i][j+2][k]*(
							c2*(u2[i+2][j+2][k]-u2[i-2][j+2][k]) +
							c1*(u2[i+1][j+2][k]-u2[i-1][j+2][k])    )
						+  mu[i][j-2][k]*met1[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u2[i+2][j-2][k]-u2[i-2][j-2][k])+
							c1*(u2[i+1][j-2][k]-u2[i-1][j-2][k])     )
				   ) +
				c1*(  mu[i][j+1][k]*met1[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u2[i+2][j+1][k]-u2[i-2][j+1][k]) +
							c1*(u2[i+1][j+1][k]-u2[i-1][j+1][k])  )
						+ mu[i][j-1][k]*met1[i][j-1][k]*met1[i][j-1][k]*(
							c2*(u2[i+2][j-1][k]-u2[i-2][j-1][k]) +
							c1*(u2[i+1][j-1][k]-u2[i-1][j-1][k])))
				+
				c2*(  la[i+2][j][k]*met1[i+2][j][k]*met1[i+2][j][k]*(
							c2*(u2[i+2][j+2][k]-u2[i+2][j-2][k]) +
							c1*(u2[i+2][j+1][k]-u2[i+2][j-1][k])    )
						+ la[i-2][j][k]*met1[i-2][j][k]*met1[i-2][j][k]*(
							c2*(u2[i-2][j+2][k]-u2[i-2][j-2][k])+
							c1*(u2[i-2][j+1][k]-u2[i-2][j-1][k])     )
				   ) +
				c1*(  la[i+1][j][k]*met1[i+1][j][k]*met1[i+1][j][k]*(
							c2*(u2[i+1][j+2][k]-u2[i+1][j-2][k]) +
							c1*(u2[i+1][j+1][k]-u2[i+1][j-1][k])  )
						+ la[i-1][j][k]*met1[i-1][j][k]*met1[i-1][j][k]*(
							c2*(u2[i-1][j+2][k]-u2[i-1][j-2][k]) +
							c1*(u2[i-1][j+1][k]-u2[i-1][j-1][k])));

		} 
	}
}

extern "C" void host_code (double *h_r1, double *h_u1, double *h_u2, double *h_u3,  double *h_mu, double *h_la, double *h_met1, double *h_met2, double *h_met3, double *h_met4, double *h_strx, double *h_stry, double c1, double c2, int N) {
	double *r1;
	cudaMalloc (&r1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for r1\n");
	cudaMemcpy (r1, h_r1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u1;
	cudaMalloc (&u1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u1\n");
	cudaMemcpy (u1, h_u1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u2;
	cudaMalloc (&u2, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u2\n");
	cudaMemcpy (u2, h_u2, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u3;
	cudaMalloc (&u3, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u3\n");
	cudaMemcpy (u3, h_u3, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *mu;
	cudaMalloc (&mu, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for mu\n");
	cudaMemcpy (mu, h_mu, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *la;
	cudaMalloc (&la, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for la\n");
	cudaMemcpy (la, h_la, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met1;
	cudaMalloc (&met1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met1\n");
	cudaMemcpy (met1, h_met1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met2;
	cudaMalloc (&met2, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met2\n");
	cudaMemcpy (met2, h_met2, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met3;
	cudaMalloc (&met3, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met3\n");
	cudaMemcpy (met3, h_met3, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met4;
	cudaMalloc (&met4, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met4\n");
	cudaMemcpy (met4, h_met4, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *strx;
	cudaMalloc (&strx, sizeof(double)*N);
	check_error ("Failed to allocate device memory for strx\n");
	cudaMemcpy (strx, h_strx, sizeof(double)*N, cudaMemcpyHostToDevice);
	double *stry;
	cudaMalloc (&stry, sizeof(double)*N);
	check_error ("Failed to allocate device memory for stry\n");
	cudaMemcpy (stry, h_stry, sizeof(double)*N, cudaMemcpyHostToDevice);

	dim3 blockconfig (16, 8);
	dim3 gridconfig (ceil(N, blockconfig.x), ceil(N, blockconfig.y), 1);

	curvi <<<gridconfig, blockconfig>>> (r1, u1, u2, u3, mu, la, met1, met2, met3, met4, strx, stry, c1, c2, N);
	cudaMemcpy (h_r1, r1, sizeof(double)*N*N*N, cudaMemcpyDeviceToHost);
}
