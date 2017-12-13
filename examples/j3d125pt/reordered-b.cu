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

__global__ void j3d125pt (double * __restrict__ t_in, double * __restrict__ t_out, int N) {
	//Determing the block's indices
	int i0 = (int)(blockIdx.x)*(int)(blockDim.x) + 2;
	int i = max(i0,2) + (int)(threadIdx.x);
	int j0 = 4*(int)(blockIdx.y)*(int)(blockDim.y) + 2;
	int j = max(j0,2) + 4*(int)(threadIdx.y);
	int k0 = (int)(blockIdx.z)*(int)(blockDim.z) + 2;
	int k = max(k0,2) + (int)(threadIdx.z);

	double (*in)[516][516] = (double (*)[516][516])t_in;
	double (*out)[516][516] = (double (*)[516][516])t_out;
	if (i>=2 && i<=N-3 && j>=2 && j<=N-3 && k>=2 && k<=N-3) {
double _t_3_ = in[k][j-2][i-2];
_t_3_ += in[k][j-2][i+2];
_t_3_ += in[k-1][j-1][i];
double _t_11_ = in[k-1][j-1][i];
_t_3_ += in[k-1][j][i-1];
double _t_7_ = in[k-1][j][i-1];
double _t_19_ = in[k-1][j][i-1];
_t_3_ += in[k-1][j][i+1];
_t_7_ += in[k-1][j][i+1];
_t_19_ += in[k-1][j][i+1];
_t_3_ += in[k-1][j+1][i];
double _t_12_ = in[k-1][j+1][i];
double _t_17_ = in[k-1][j+1][i];
double _t_25_ = in[k-1][j+1][i];
_t_3_ += in[k][j+2][i-2];
_t_11_ += in[k][j+2][i-2];
double _t_16_ = in[k][j+2][i-2];
_t_25_ += in[k][j+2][i-2];
_t_3_ += in[k][j+2][i+2];
_t_11_ += in[k][j+2][i+2];
_t_16_ += in[k][j+2][i+2];
_t_25_ += in[k][j+2][i+2];
_t_3_ += in[k+1][j-1][i];
_t_11_ += in[k+1][j-1][i];
_t_3_ += in[k+1][j][i-1];
_t_7_ += in[k+1][j][i-1];
_t_19_ += in[k+1][j][i-1];
_t_3_ += in[k+1][j][i+1];
_t_7_ += in[k+1][j][i+1];
_t_19_ += in[k+1][j][i+1];
_t_3_ += in[k+1][j+1][i];
_t_12_ += in[k+1][j+1][i];
_t_17_ += in[k+1][j+1][i];
_t_25_ += in[k+1][j+1][i];
_t_3_ += in[k-2][j][i-2];
double _t_9_ = in[k-2][j][i-2];
_t_9_ += in[k-2][j][i-2];
double _t_14_ = in[k-2][j][i-2];
double _t_15_ = in[k-2][j][i-2];
_t_3_ += in[k-2][j-2][i];
_t_3_ += in[k-2][j+2][i];
_t_11_ += in[k-2][j+2][i];
_t_11_ += in[k-2][j+2][i];
_t_16_ += in[k-2][j+2][i];
_t_16_ += in[k-2][j+2][i];
_t_25_ += in[k-2][j+2][i];
_t_25_ += in[k-2][j+2][i];
_t_3_ += in[k-2][j][i-2];
_t_3_ += in[k-2][j][i+2];
_t_9_ += in[k-2][j][i+2];
_t_9_ += in[k-2][j][i+2];
_t_14_ += in[k-2][j][i+2];
_t_15_ += in[k-2][j][i+2];
_t_3_ += in[k-2][j+2][i];
double outkc0jc0ic0 = 0.217 * _t_3_;
double _t_2_ = in[k-1][j-2][i-2];
_t_2_ += in[k-1][j-2][i+2];
_t_2_ += in[k][j-2][i];
_t_2_ += in[k+1][j-2][i-2];
_t_2_ += in[k+1][j-2][i+2];
_t_2_ += in[k-1][j+2][i-2];
_t_12_ += in[k-1][j+2][i-2];
double _t_18_ = in[k-1][j+2][i-2];
double _t_26_ = in[k-1][j+2][i-2];
_t_2_ += in[k-1][j+2][i+2];
_t_12_ += in[k-1][j+2][i+2];
_t_18_ += in[k-1][j+2][i+2];
_t_26_ += in[k-1][j+2][i+2];
_t_2_ += in[k][j][i-2];
_t_11_ += in[k][j][i-2];
_t_17_ += in[k][j][i-2];
_t_2_ += in[k][j][i+2];
_t_11_ += in[k][j][i+2];
_t_17_ += in[k][j][i+2];
_t_2_ += in[k][j+2][i];
_t_7_ += in[k][j+2][i];
_t_18_ += in[k][j+2][i];
double _t_21_ = in[k][j+2][i];
_t_2_ += in[k+1][j+2][i-2];
_t_12_ += in[k+1][j+2][i-2];
_t_18_ += in[k+1][j+2][i-2];
_t_26_ += in[k+1][j+2][i-2];
_t_2_ += in[k+1][j+2][i+2];
_t_12_ += in[k+1][j+2][i+2];
_t_18_ += in[k+1][j+2][i+2];
_t_26_ += in[k+1][j+2][i+2];
_t_2_ += in[k-2][j][i];
_t_11_ += in[k-2][j][i];
_t_11_ += in[k-2][j][i];
_t_17_ += in[k-2][j][i];
_t_17_ += in[k-2][j][i];
_t_2_ += in[k-2][j-1][i+2];
_t_7_ += in[k-2][j-1][i+2];
double _t_8_ = in[k-2][j-1][i+2];
_t_2_ += in[k-2][j+2][i+1];
_t_12_ += in[k-2][j+2][i+1];
double _t_13_ = in[k-2][j+2][i+1];
_t_18_ += in[k-2][j+2][i+1];
_t_18_ += in[k-2][j+2][i+1];
_t_26_ += in[k-2][j+2][i+1];
double _t_27_ = in[k-2][j+2][i+1];
_t_2_ += in[k-2][j+2][i-1];
_t_12_ += in[k-2][j+2][i-1];
_t_13_ += in[k-2][j+2][i-1];
_t_18_ += in[k-2][j+2][i-1];
_t_18_ += in[k-2][j+2][i-1];
_t_26_ += in[k-2][j+2][i-1];
_t_27_ += in[k-2][j+2][i-1];
_t_2_ += in[k-2][j-1][i+2];
_t_2_ += in[k-2][j+1][i+2];
double _t_10_ = in[k-2][j+1][i+2];
_t_10_ += in[k-2][j+1][i+2];
_t_16_ += in[k-2][j+1][i+2];
_t_16_ += in[k-2][j+1][i+2];
_t_21_ += in[k-2][j+1][i+2];
double _t_22_ = in[k-2][j+1][i+2];
_t_2_ += in[k-2][j+1][i+2];
_t_2_ += in[k-2][j][i];
_t_2_ += in[k-2][j+1][i-2];
_t_10_ += in[k-2][j+1][i-2];
_t_10_ += in[k-2][j+1][i-2];
_t_16_ += in[k-2][j+1][i-2];
_t_16_ += in[k-2][j+1][i-2];
_t_21_ += in[k-2][j+1][i-2];
_t_22_ += in[k-2][j+1][i-2];
_t_2_ += in[k-2][j+2][i-1];
_t_2_ += in[k-2][j-1][i-2];
_t_7_ += in[k-2][j-1][i-2];
_t_8_ += in[k-2][j-1][i-2];
_t_2_ += in[k-2][j+1][i-2];
_t_2_ += in[k-2][j-1][i-2];
outkc0jc0ic0 += 1.132 * _t_2_;
double _t_4_ = in[k-1][j-2][i];
_t_4_ += in[k][j-2][i-1];
_t_4_ += in[k][j-2][i+1];
_t_4_ += in[k+1][j-2][i];
_t_4_ += in[k-1][j][i-2];
_t_12_ += in[k-1][j][i-2];
_t_16_ += in[k-1][j][i-2];
_t_4_ += in[k-1][j][i+2];
_t_12_ += in[k-1][j][i+2];
_t_16_ += in[k-1][j][i+2];
_t_4_ += in[k-1][j+2][i];
_t_10_ += in[k-1][j+2][i];
_t_19_ += in[k-1][j+2][i];
double _t_24_ = in[k-1][j+2][i];
_t_4_ += in[k][j-1][i-2];
_t_10_ += in[k][j-1][i-2];
_t_4_ += in[k][j-1][i+2];
_t_10_ += in[k][j-1][i+2];
_t_4_ += in[k][j][i];
_t_7_ += in[k][j][i];
_t_16_ += in[k][j][i];
_t_4_ += in[k][j+1][i-2];
_t_9_ += in[k][j+1][i-2];
_t_18_ += in[k][j+1][i-2];
_t_24_ += in[k][j+1][i-2];
_t_4_ += in[k][j+1][i+2];
_t_9_ += in[k][j+1][i+2];
_t_18_ += in[k][j+1][i+2];
_t_24_ += in[k][j+1][i+2];
_t_4_ += in[k][j+2][i-1];
_t_12_ += in[k][j+2][i-1];
_t_14_ += in[k][j+2][i-1];
_t_26_ += in[k][j+2][i-1];
_t_4_ += in[k][j+2][i+1];
_t_12_ += in[k][j+2][i+1];
_t_14_ += in[k][j+2][i+1];
_t_26_ += in[k][j+2][i+1];
_t_4_ += in[k+1][j][i-2];
_t_12_ += in[k+1][j][i-2];
_t_16_ += in[k+1][j][i-2];
_t_4_ += in[k+1][j][i+2];
_t_12_ += in[k+1][j][i+2];
_t_16_ += in[k+1][j][i+2];
_t_4_ += in[k+1][j+2][i];
_t_10_ += in[k+1][j+2][i];
_t_19_ += in[k+1][j+2][i];
_t_24_ += in[k+1][j+2][i];
_t_4_ += in[k-2][j-1][i];
_t_10_ += in[k-2][j-1][i];
_t_10_ += in[k-2][j-1][i];
_t_4_ += in[k-2][j][i-1];
_t_12_ += in[k-2][j][i-1];
_t_13_ += in[k-2][j][i-1];
_t_16_ += in[k-2][j][i-1];
_t_16_ += in[k-2][j][i-1];
_t_4_ += in[k-2][j][i+1];
_t_12_ += in[k-2][j][i+1];
_t_13_ += in[k-2][j][i+1];
_t_16_ += in[k-2][j][i+1];
_t_16_ += in[k-2][j][i+1];
_t_4_ += in[k-2][j+1][i];
_t_9_ += in[k-2][j+1][i];
_t_9_ += in[k-2][j+1][i];
_t_18_ += in[k-2][j+1][i];
_t_18_ += in[k-2][j+1][i];
_t_24_ += in[k-2][j+1][i];
_t_24_ += in[k-2][j+1][i];
_t_4_ += in[k-2][j-1][i];
_t_4_ += in[k-2][j][i-1];
_t_4_ += in[k-2][j][i+1];
_t_4_ += in[k-2][j+1][i];
outkc0jc0ic0 += 2.13 * _t_4_;
double _t_0_ = in[k-2][j-2][i-2];
_t_0_ += in[k-2][j-2][i+2];
double _t_1_ = in[k-2][j-2][i-2];
_t_1_ += in[k-2][j-2][i+2];
_t_0_ += in[k-2][j+2][i-2];
_t_9_ += in[k-2][j+2][i-2];
_t_9_ += in[k-2][j+2][i-2];
_t_17_ += in[k-2][j+2][i-2];
_t_17_ += in[k-2][j+2][i-2];
double _t_23_ = in[k-2][j+2][i-2];
_t_23_ += in[k-2][j+2][i-2];
_t_0_ += in[k-2][j+2][i+2];
_t_9_ += in[k-2][j+2][i+2];
_t_9_ += in[k-2][j+2][i+2];
_t_17_ += in[k-2][j+2][i+2];
_t_17_ += in[k-2][j+2][i+2];
_t_23_ += in[k-2][j+2][i+2];
_t_23_ += in[k-2][j+2][i+2];
_t_0_ += in[k-1][j-1][i-1];
_t_12_ += in[k-1][j-1][i-1];
_t_0_ += in[k-1][j-1][i+1];
_t_12_ += in[k-1][j-1][i+1];
_t_0_ += in[k-1][j+1][i-1];
_t_10_ += in[k-1][j+1][i-1];
_t_14_ += in[k-1][j+1][i-1];
_t_26_ += in[k-1][j+1][i-1];
_t_0_ += in[k-1][j+1][i+1];
_t_10_ += in[k-1][j+1][i+1];
_t_14_ += in[k-1][j+1][i+1];
_t_26_ += in[k-1][j+1][i+1];
_t_0_ += in[k][j-1][i];
_t_9_ += in[k][j-1][i];
_t_0_ += in[k][j][i-1];
_t_12_ += in[k][j][i-1];
_t_18_ += in[k][j][i-1];
_t_0_ += in[k][j][i+1];
_t_12_ += in[k][j][i+1];
_t_18_ += in[k][j][i+1];
_t_0_ += in[k][j+1][i];
_t_11_ += in[k][j+1][i];
_t_14_ += in[k][j+1][i];
_t_23_ += in[k][j+1][i];
_t_0_ += in[k+1][j-1][i-1];
_t_12_ += in[k+1][j-1][i-1];
_t_0_ += in[k+1][j-1][i+1];
_t_12_ += in[k+1][j-1][i+1];
_t_0_ += in[k+1][j+1][i-1];
_t_10_ += in[k+1][j+1][i-1];
_t_14_ += in[k+1][j+1][i-1];
_t_26_ += in[k+1][j+1][i-1];
_t_0_ += in[k+1][j+1][i+1];
_t_10_ += in[k+1][j+1][i+1];
_t_14_ += in[k+1][j+1][i+1];
_t_26_ += in[k+1][j+1][i+1];
outkc0jc0ic0 += 0.75 * _t_0_;
_t_1_ += in[k-2][j+2][i-2];
_t_1_ += in[k-2][j+2][i+2];
outkc0jc0ic0 += 0.76 * _t_1_;
double _t_5_ = in[k-1][j-2][i-1];
_t_5_ += in[k-1][j-2][i+1];
_t_5_ += in[k+1][j-2][i-1];
_t_5_ += in[k+1][j-2][i+1];
_t_5_ += in[k-2][j-1][i-1];
_t_9_ += in[k-2][j-1][i-1];
_t_9_ += in[k-2][j-1][i-1];
_t_5_ += in[k-2][j-1][i+1];
_t_9_ += in[k-2][j-1][i+1];
_t_9_ += in[k-2][j-1][i+1];
_t_5_ += in[k-2][j+1][i-1];
_t_11_ += in[k-2][j+1][i-1];
_t_11_ += in[k-2][j+1][i-1];
_t_19_ += in[k-2][j+1][i-1];
double _t_20_ = in[k-2][j+1][i-1];
_t_23_ += in[k-2][j+1][i-1];
_t_23_ += in[k-2][j+1][i-1];
_t_5_ += in[k-2][j+1][i+1];
_t_11_ += in[k-2][j+1][i+1];
_t_11_ += in[k-2][j+1][i+1];
_t_19_ += in[k-2][j+1][i+1];
_t_20_ += in[k-2][j+1][i+1];
_t_23_ += in[k-2][j+1][i+1];
_t_23_ += in[k-2][j+1][i+1];
_t_5_ += in[k-1][j-1][i-2];
_t_9_ += in[k-1][j-1][i-2];
_t_5_ += in[k-1][j-1][i+2];
_t_9_ += in[k-1][j-1][i+2];
_t_5_ += in[k-1][j][i];
_t_10_ += in[k-1][j][i];
_t_18_ += in[k-1][j][i];
_t_5_ += in[k-1][j+1][i-2];
_t_11_ += in[k-1][j+1][i-2];
_t_19_ += in[k-1][j+1][i-2];
_t_23_ += in[k-1][j+1][i-2];
_t_5_ += in[k-1][j+1][i+2];
_t_11_ += in[k-1][j+1][i+2];
_t_19_ += in[k-1][j+1][i+2];
_t_23_ += in[k-1][j+1][i+2];
_t_5_ += in[k-1][j+2][i-1];
_t_7_ += in[k-1][j+2][i-1];
_t_17_ += in[k-1][j+2][i-1];
_t_21_ += in[k-1][j+2][i-1];
_t_5_ += in[k-1][j+2][i+1];
_t_7_ += in[k-1][j+2][i+1];
_t_17_ += in[k-1][j+2][i+1];
_t_21_ += in[k-1][j+2][i+1];
_t_5_ += in[k][j-1][i-1];
_t_11_ += in[k][j-1][i-1];
_t_5_ += in[k][j-1][i+1];
_t_11_ += in[k][j-1][i+1];
_t_5_ += in[k][j+1][i-1];
_t_7_ += in[k][j+1][i-1];
_t_19_ += in[k][j+1][i-1];
_t_25_ += in[k][j+1][i-1];
_t_5_ += in[k][j+1][i+1];
_t_7_ += in[k][j+1][i+1];
_t_19_ += in[k][j+1][i+1];
_t_25_ += in[k][j+1][i+1];
_t_5_ += in[k+1][j-1][i-2];
_t_9_ += in[k+1][j-1][i-2];
_t_5_ += in[k+1][j-1][i+2];
_t_9_ += in[k+1][j-1][i+2];
_t_5_ += in[k+1][j][i];
_t_10_ += in[k+1][j][i];
_t_18_ += in[k+1][j][i];
_t_5_ += in[k+1][j+1][i-2];
_t_11_ += in[k+1][j+1][i-2];
_t_19_ += in[k+1][j+1][i-2];
_t_23_ += in[k+1][j+1][i-2];
_t_5_ += in[k+1][j+1][i+2];
_t_11_ += in[k+1][j+1][i+2];
_t_19_ += in[k+1][j+1][i+2];
_t_23_ += in[k+1][j+1][i+2];
_t_5_ += in[k+1][j+2][i-1];
_t_7_ += in[k+1][j+2][i-1];
_t_17_ += in[k+1][j+2][i-1];
_t_21_ += in[k+1][j+2][i-1];
_t_5_ += in[k+1][j+2][i+1];
_t_7_ += in[k+1][j+2][i+1];
_t_17_ += in[k+1][j+2][i+1];
_t_21_ += in[k+1][j+2][i+1];
outkc0jc0ic0 += 0.331 * _t_5_;
double _t_6_ = in[k-2][j-1][i-1];
_t_6_ += in[k-2][j-1][i+1];
_t_6_ += in[k-2][j+1][i-1];
_t_6_ += in[k-2][j+1][i+1];
outkc0jc0ic0 += 0.332 * _t_6_;

_t_7_ += in[k-2][j+3][i-2];
_t_16_ += in[k-2][j+3][i-2];
_t_16_ += in[k-2][j+3][i-2];
_t_24_ += in[k-2][j+3][i-2];
_t_24_ += in[k-2][j+3][i-2];
_t_7_ += in[k-2][j+3][i+2];
_t_16_ += in[k-2][j+3][i+2];
_t_16_ += in[k-2][j+3][i+2];
_t_24_ += in[k-2][j+3][i+2];
_t_24_ += in[k-2][j+3][i+2];
double outkc0jp1ic0 = 0.75 * _t_7_;
_t_8_ += in[k-2][j+3][i-2];
_t_8_ += in[k-2][j+3][i+2];
outkc0jp1ic0 += 0.76 * _t_8_;
_t_9_ += in[k-2][j+3][i-1];
_t_19_ += in[k-2][j+3][i-1];
_t_25_ += in[k-2][j+3][i-1];
_t_25_ += in[k-2][j+3][i-1];
_t_9_ += in[k-2][j+3][i+1];
_t_19_ += in[k-2][j+3][i+1];
_t_25_ += in[k-2][j+3][i+1];
_t_25_ += in[k-2][j+3][i+1];
_t_9_ += in[k-2][j+3][i-1];
_t_9_ += in[k-2][j+3][i+1];
_t_9_ += in[k-1][j+3][i-2];
_t_19_ += in[k-1][j+3][i-2];
_t_25_ += in[k-1][j+3][i-2];
_t_9_ += in[k-1][j+3][i+2];
_t_19_ += in[k-1][j+3][i+2];
_t_25_ += in[k-1][j+3][i+2];
_t_9_ += in[k][j+3][i];
_t_14_ += in[k][j+3][i];
_t_25_ += in[k][j+3][i];
_t_9_ += in[k+1][j+3][i-2];
_t_19_ += in[k+1][j+3][i-2];
_t_25_ += in[k+1][j+3][i-2];
_t_9_ += in[k+1][j+3][i+2];
_t_19_ += in[k+1][j+3][i+2];
_t_25_ += in[k+1][j+3][i+2];
outkc0jp1ic0 += 1.132 * _t_9_;
_t_20_ += in[k-2][j+3][i-1];
_t_20_ += in[k-2][j+3][i+1];
double outkc0jp2ic0 = 0.332 * _t_20_;
_t_10_ += in[k-2][j+3][i];
_t_18_ += in[k-2][j+3][i];
_t_18_ += in[k-2][j+3][i];
_t_23_ += in[k-2][j+3][i];
_t_23_ += in[k-2][j+3][i];
_t_10_ += in[k-2][j+3][i];
_t_10_ += in[k][j+3][i-2];
_t_18_ += in[k][j+3][i-2];
_t_23_ += in[k][j+3][i-2];
_t_10_ += in[k][j+3][i+2];
_t_18_ += in[k][j+3][i+2];
_t_23_ += in[k][j+3][i+2];
outkc0jp1ic0 += 0.217 * _t_10_;
_t_11_ += in[k-1][j+3][i];
_t_17_ += in[k-1][j+3][i];
_t_26_ += in[k-1][j+3][i];
_t_11_ += in[k][j+3][i-1];
_t_19_ += in[k][j+3][i-1];
_t_21_ += in[k][j+3][i-1];
_t_11_ += in[k][j+3][i+1];
_t_19_ += in[k][j+3][i+1];
_t_21_ += in[k][j+3][i+1];
_t_11_ += in[k+1][j+3][i];
_t_17_ += in[k+1][j+3][i];
_t_26_ += in[k+1][j+3][i];
outkc0jp1ic0 += 2.13 * _t_11_;
_t_12_ += in[k-1][j+3][i-1];
_t_14_ += in[k-1][j+3][i-1];
_t_24_ += in[k-1][j+3][i-1];
_t_12_ += in[k-1][j+3][i+1];
_t_14_ += in[k-1][j+3][i+1];
_t_24_ += in[k-1][j+3][i+1];
_t_12_ += in[k+1][j+3][i-1];
_t_14_ += in[k+1][j+3][i-1];
_t_24_ += in[k+1][j+3][i-1];
_t_12_ += in[k+1][j+3][i+1];
_t_14_ += in[k+1][j+3][i+1];
_t_24_ += in[k+1][j+3][i+1];
outkc0jp1ic0 += 0.331 * _t_12_;
outkc0jp1ic0 += 0.332 * _t_13_;

_t_14_ += in[k-2][j+4][i-2];
_t_23_ += in[k-2][j+4][i-2];
_t_23_ += in[k-2][j+4][i-2];
_t_14_ += in[k-2][j+4][i+2];
_t_23_ += in[k-2][j+4][i+2];
_t_23_ += in[k-2][j+4][i+2];
outkc0jp2ic0 += 0.75 * _t_14_;
_t_15_ += in[k-2][j+4][i-2];
_t_15_ += in[k-2][j+4][i+2];
outkc0jp2ic0 += 0.76 * _t_15_;
_t_16_ += in[k-2][j+4][i-1];
_t_16_ += in[k-2][j+4][i+1];
_t_16_ += in[k-2][j+4][i-1];
_t_16_ += in[k-2][j+4][i+1];
_t_16_ += in[k-1][j+4][i-2];
_t_16_ += in[k-1][j+4][i+2];
_t_16_ += in[k][j+4][i];
_t_21_ += in[k][j+4][i];
_t_16_ += in[k+1][j+4][i-2];
_t_16_ += in[k+1][j+4][i+2];
outkc0jp2ic0 += 1.132 * _t_16_;
_t_27_ += in[k-2][j+4][i-1];
_t_27_ += in[k-2][j+4][i+1];
double outkc0jp3ic0 = 0.332 * _t_27_;
_t_17_ += in[k-2][j+4][i];
_t_17_ += in[k-2][j+4][i];
_t_17_ += in[k][j+4][i-2];
_t_17_ += in[k][j+4][i+2];
outkc0jp2ic0 += 0.217 * _t_17_;
_t_25_ += in[k-2][j+4][i];
_t_25_ += in[k-2][j+4][i];
_t_25_ += in[k][j+4][i-2];
_t_25_ += in[k][j+4][i+2];
_t_25_ += in[k-1][j+5][i];
_t_25_ += in[k][j+5][i-1];
_t_25_ += in[k][j+5][i+1];
_t_25_ += in[k+1][j+5][i];
outkc0jp3ic0 += 2.13 * _t_25_;
_t_18_ += in[k-1][j+4][i];
_t_24_ += in[k-1][j+4][i];
_t_18_ += in[k][j+4][i-1];
_t_18_ += in[k][j+4][i+1];
_t_18_ += in[k+1][j+4][i];
_t_24_ += in[k+1][j+4][i];
outkc0jp2ic0 += 2.13 * _t_18_;
_t_19_ += in[k-1][j+4][i-1];
_t_21_ += in[k-1][j+4][i-1];
_t_19_ += in[k-1][j+4][i+1];
_t_21_ += in[k-1][j+4][i+1];
_t_19_ += in[k+1][j+4][i-1];
_t_21_ += in[k+1][j+4][i-1];
_t_19_ += in[k+1][j+4][i+1];
_t_21_ += in[k+1][j+4][i+1];
outkc0jp2ic0 += 0.331 * _t_19_;
_t_26_ += in[k-1][j+4][i-2];
_t_26_ += in[k-1][j+4][i+2];
_t_26_ += in[k][j+4][i-1];
_t_26_ += in[k][j+4][i+1];
_t_26_ += in[k+1][j+4][i-2];
_t_26_ += in[k+1][j+4][i+2];
_t_26_ += in[k-1][j+5][i-1];
_t_26_ += in[k-1][j+5][i+1];
_t_26_ += in[k+1][j+5][i-1];
_t_26_ += in[k+1][j+5][i+1];
_t_26_ += in[k-2][j+4][i-1];
_t_26_ += in[k-2][j+4][i+1];
outkc0jp3ic0 += 0.331 * _t_26_;

_t_21_ += in[k-2][j+5][i-2];
_t_21_ += in[k-2][j+5][i+2];
_t_22_ += in[k-2][j+5][i-2];
_t_22_ += in[k-2][j+5][i+2];
outkc0jp3ic0 += 0.75 * _t_21_;
outkc0jp3ic0 += 0.76 * _t_22_;
_t_23_ += in[k-2][j+5][i+1];
outkc0jp3ic0 += 1.132 * _t_23_;
_t_24_ += in[k-2][j+5][i];
outkc0jp3ic0 += 0.217 * _t_24_;

out[k][j][i] = outkc0jc0ic0;
out[k][j+1][i] = outkc0jp1ic0;
out[k][j+2][i] = outkc0jp2ic0;
out[k][j+3][i] = outkc0jp3ic0;
	}
}

extern "C" void host_code (double *h_in, double *h_out, int N) {
	double *in;
	cudaMalloc (&in, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for in\n");
	cudaMemcpy (in, h_in, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *out;
	cudaMalloc (&out, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for out\n");

	dim3 blockconfig (16, 4, 4);
	dim3 gridconfig (ceil(N-4, blockconfig.x), ceil(N-4, 4*blockconfig.y), ceil(N-4, blockconfig.z));

	j3d125pt<<<gridconfig, blockconfig>>> (in, out, N);

	cudaMemcpy (h_out, out, sizeof(double)*N*N*N, cudaMemcpyDeviceToHost);

	cudaFree (in); 
	cudaFree (out);
}
