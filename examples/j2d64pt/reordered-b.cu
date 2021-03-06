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

__global__ void j2d64pt (double * __restrict__ l_in, double * __restrict__ l_out, int N) {
	//Determing the block's indices
	int i0 = (int)(blockIdx.x)*(int)(blockDim.x) + 4;
	int i = max(i0,4) + (int)(threadIdx.x);
	int j0 = 4*(int)(blockIdx.y)*(int)(blockDim.y) + 4;
	int j = max(j0,4) + 4*(int)(threadIdx.y);

	double (*in)[8200] = (double (*)[8200]) l_in;
	double (*out)[8200] = (double (*)[8200]) l_out;

	if (i>=4 & j>=4 & i<=N-5 & j<=N-5) {
double _t_0_ = in[j-4][i-4];
_t_0_ -= in[j-4][i+4];
_t_0_ -= in[j+4][i-4];
double _t_11_ = in[j+4][i-4];
double _t_22_ = -(in[j+4][i-4]);
double _t_33_ = in[j+4][i-4];
_t_0_ += in[j+4][i+4];
_t_11_ -= in[j+4][i+4];
_t_22_ += in[j+4][i+4];
_t_33_ -= in[j+4][i+4];
double outjc0ic0 = _t_0_ * 1.27449;
double _t_4_ = in[j-3][i-3];
_t_11_ += -in[j-3][i-3];
_t_4_ -= in[j-3][i+3];
_t_11_ += in[j-3][i+3];
_t_4_ -= in[j+3][i-3];
double _t_15_ = in[j+3][i-3];
double _t_26_ = -(in[j+3][i-3]);
_t_4_ += in[j+3][i+3];
_t_15_ -= in[j+3][i+3];
_t_26_ += in[j+3][i+3];
outjc0ic0 += _t_4_ * 0.00145161;
double _t_7_ = in[j-2][i-2];
_t_15_ += -in[j-2][i-2];
_t_22_ += in[j-2][i-2];
_t_7_ -= in[j-2][i+2];
_t_15_ += in[j-2][i+2];
_t_22_ -= in[j-2][i+2];
_t_7_ -= in[j+2][i-2];
double _t_18_ = in[j+2][i-2];
double _t_38_ = -(in[j+2][i-2]);
_t_7_ += in[j+2][i+2];
_t_18_ -= in[j+2][i+2];
_t_38_ += in[j+2][i+2];
outjc0ic0 += _t_7_ * 0.04;
double _t_9_ = in[j-1][i-1];
_t_18_ += -in[j-1][i-1];
_t_26_ += in[j-1][i-1];
_t_33_ += -in[j-1][i-1];
_t_9_ -= in[j-1][i+1];
_t_18_ += in[j-1][i+1];
_t_26_ -= in[j-1][i+1];
_t_33_ += in[j-1][i+1];
_t_9_ -= in[j+1][i-1];
double _t_29_ = in[j+1][i-1];
_t_38_ += -in[j+1][i-1];
_t_9_ += in[j+1][i+1];
_t_29_ -= in[j+1][i+1];
_t_38_ += in[j+1][i+1];
outjc0ic0 += _t_9_ * 0.64;
double _t_1_ = -in[j-4][i-3];
_t_1_ += in[j-4][i+3];
_t_1_ += in[j-3][i+4];
double _t_10_ = -(in[j-3][i+4]);
_t_1_ -= in[j-3][i-4];
_t_10_ += in[j-3][i-4];
_t_1_ += in[j+3][i-4];
double _t_12_ = -(in[j+3][i-4]);
double _t_23_ = in[j+3][i-4];
_t_1_ -= in[j+3][i+4];
_t_12_ += in[j+3][i+4];
_t_23_ -= in[j+3][i+4];
_t_1_ += in[j+4][i-3];
double _t_14_ = -(in[j+4][i-3]);
double _t_25_ = in[j+4][i-3];
double _t_36_ = -(in[j+4][i-3]);
_t_1_ -= in[j+4][i+3];
_t_14_ += in[j+4][i+3];
_t_25_ -= in[j+4][i+3];
_t_36_ += in[j+4][i+3];
outjc0ic0 += _t_1_ * 0.000136017;
double _t_2_ = in[j-4][i-2];
_t_2_ -= in[j-4][i+2];
_t_2_ += in[j-2][i-4];
_t_11_ -= in[j-2][i-4];
double _t_20_ = in[j-2][i-4];
_t_2_ -= in[j-2][i+4];
_t_11_ += in[j-2][i+4];
_t_20_ -= in[j-2][i+4];
_t_2_ -= in[j+2][i-4];
double _t_13_ = in[j+2][i-4];
_t_33_ -= in[j+2][i-4];
_t_2_ += in[j+2][i+4];
_t_13_ -= in[j+2][i+4];
_t_33_ += in[j+2][i+4];
_t_2_ -= in[j+4][i-2];
_t_15_ += in[j+4][i-2];
double _t_27_ = -(in[j+4][i-2]);
_t_38_ += in[j+4][i-2];
_t_2_ += in[j+4][i+2];
_t_15_ -= in[j+4][i+2];
_t_27_ += in[j+4][i+2];
_t_38_ -= in[j+4][i+2];
outjc0ic0 += _t_2_ * 0.000714;
double _t_3_ = -in[j-4][i-1];
_t_3_ += in[j-4][i+1];
_t_3_ -= in[j-1][i-4];
_t_12_ += in[j-1][i-4];
double _t_21_ = -(in[j-1][i-4]);
double _t_30_ = in[j-1][i-4];
_t_3_ += in[j-1][i+4];
_t_12_ -= in[j-1][i+4];
_t_21_ += in[j-1][i+4];
_t_30_ -= in[j-1][i+4];
_t_3_ += in[j+1][i-4];
_t_23_ -= in[j+1][i-4];
double _t_32_ = in[j+1][i-4];
_t_3_ -= in[j+1][i+4];
_t_23_ += in[j+1][i+4];
_t_32_ -= in[j+1][i+4];
_t_3_ += in[j+4][i-1];
double _t_16_ = -(in[j+4][i-1]);
double _t_28_ = in[j+4][i-1];
double _t_39_ = -(in[j+4][i-1]);
_t_3_ -= in[j+4][i+1];
_t_16_ += in[j+4][i+1];
_t_28_ -= in[j+4][i+1];
_t_39_ += in[j+4][i+1];
outjc0ic0 += _t_3_ * 0.002856;
double _t_5_ = -in[j-3][i-2];
_t_12_ += in[j-3][i-2];
_t_5_ += in[j-3][i+2];
_t_12_ -= in[j-3][i+2];
_t_5_ -= in[j-2][i-3];
_t_14_ += in[j-2][i-3];
_t_21_ += -in[j-2][i-3];
_t_5_ += in[j-2][i+3];
_t_14_ -= in[j-2][i+3];
_t_21_ += in[j-2][i+3];
_t_5_ += in[j+2][i-3];
_t_16_ -= in[j+2][i-3];
_t_36_ += in[j+2][i-3];
_t_5_ -= in[j+2][i+3];
_t_16_ += in[j+2][i+3];
_t_36_ -= in[j+2][i+3];
_t_5_ += in[j+3][i-2];
double _t_17_ = -(in[j+3][i-2]);
_t_28_ += in[j+3][i-2];
_t_5_ -= in[j+3][i+2];
_t_17_ += in[j+3][i+2];
_t_28_ -= in[j+3][i+2];
outjc0ic0 += _t_5_ * 0.00762;
double _t_6_ = in[j-3][i-1];
_t_13_ += -in[j-3][i-1];
_t_6_ -= in[j-3][i+1];
_t_13_ += in[j-3][i+1];
_t_6_ += in[j-1][i-3];
_t_15_ -= in[j-1][i-3];
double _t_24_ = in[j-1][i-3];
double _t_31_ = -in[j-1][i-3];
_t_6_ -= in[j-1][i+3];
_t_15_ += in[j-1][i+3];
_t_24_ -= in[j-1][i+3];
_t_31_ += in[j-1][i+3];
_t_6_ -= in[j+1][i-3];
_t_26_ += in[j+1][i-3];
double _t_35_ = -(in[j+1][i-3]);
_t_6_ += in[j+1][i+3];
_t_26_ -= in[j+1][i+3];
_t_35_ += in[j+1][i+3];
_t_6_ -= in[j+3][i-1];
_t_18_ += in[j+3][i-1];
_t_29_ -= in[j+3][i-1];
_t_6_ += in[j+3][i+1];
_t_18_ -= in[j+3][i+1];
_t_29_ += in[j+3][i+1];
outjc0ic0 += _t_6_ * 0.03048;
double _t_8_ = -in[j-2][i-1];
_t_16_ += in[j-2][i-1];
_t_23_ += -in[j-2][i-1];
_t_8_ += in[j-2][i+1];
_t_16_ -= in[j-2][i+1];
_t_23_ += in[j-2][i+1];
_t_8_ -= in[j-1][i-2];
_t_17_ += in[j-1][i-2];
_t_25_ += -in[j-1][i-2];
_t_32_ += in[j-1][i-2];
_t_8_ += in[j-1][i+2];
_t_17_ -= in[j-1][i+2];
_t_25_ += in[j-1][i+2];
_t_32_ -= in[j-1][i+2];
_t_8_ += in[j+1][i-2];
_t_28_ -= in[j+1][i-2];
double _t_37_ = in[j+1][i-2];
_t_8_ -= in[j+1][i+2];
_t_28_ += in[j+1][i+2];
_t_37_ -= in[j+1][i+2];
_t_8_ += in[j+2][i-1];
double _t_19_ = -(in[j+2][i-1]);
_t_39_ += in[j+2][i-1];
_t_8_ -= in[j+2][i+1];
_t_19_ += in[j+2][i+1];
_t_39_ -= in[j+2][i+1];
outjc0ic0 += _t_8_ * 0.16;

_t_10_ -= in[j+5][i-4];
_t_21_ += in[j+5][i-4];
_t_33_ += in[j+7][i-1];
_t_33_ -= in[j+7][i+1];
double outjp3ic0 = _t_33_ * 0.002856;
_t_30_ -= in[j+7][i-4];
_t_30_ += in[j+7][i+4];
outjp3ic0 += _t_30_ * 1.27449;
_t_10_ += in[j+5][i+4];
_t_21_ -= in[j+5][i+4];
double outjp1ic0 = _t_10_ * 1.27449;
_t_32_ -= in[j+5][i-4];
_t_32_ += in[j+5][i+4];
_t_32_ -= in[j+7][i-2];
_t_32_ += in[j+7][i+2];
outjp3ic0 += _t_32_ * 0.000714;
_t_11_ += in[j+5][i-3];
_t_35_ += in[j+5][i-3];
_t_11_ -= in[j+5][i+3];
_t_35_ -= in[j+5][i+3];
outjp1ic0 += _t_11_ * 0.000136017;
_t_24_ -= in[j+5][i-3];
_t_24_ += in[j+5][i+3];
double outjp2ic0 = _t_24_ * 0.00145161;
_t_12_ -= in[j+5][i-2];
_t_12_ += in[j+5][i+2];
outjp1ic0 += _t_12_ * 0.000714;
_t_37_ -= in[j+5][i-2];
_t_37_ += in[j+5][i+2];
outjp3ic0 += _t_37_ * 0.04;
outjp1ic0 += _t_14_ * 0.00145161;
outjp1ic0 += _t_15_ * 0.00762;
outjp1ic0 += _t_17_ * 0.04;
_t_13_ -= in[j][i-4];
_t_22_ += in[j][i-4];
_t_31_ -= in[j][i-4];
_t_13_ += in[j][i+4];
_t_22_ -= in[j][i+4];
_t_31_ += in[j][i+4];
_t_13_ += in[j+5][i-1];
_t_13_ -= in[j+5][i+1];
outjp1ic0 += _t_13_ * 0.002856;
_t_26_ -= in[j+5][i-1];
_t_26_ += in[j+5][i+1];
outjp2ic0 += _t_26_ * 0.03048;
_t_38_ += in[j+5][i-1];
_t_38_ -= in[j+5][i+1];
outjp3ic0 += _t_38_ * 0.16;
_t_16_ += in[j][i-3];
double _t_34_ = in[j][i-3];
_t_16_ -= in[j][i+3];
_t_34_ -= in[j][i+3];
outjp1ic0 += _t_16_ * 0.03048;
_t_18_ -= in[j][i-2];
_t_35_ += -in[j][i-2];
_t_18_ += in[j][i+2];
_t_35_ += in[j][i+2];
outjp1ic0 += _t_18_ * 0.16;
_t_27_ += in[j][i-2];
_t_27_ -= in[j][i+2];
outjp2ic0 += _t_27_ * 0.04;
_t_19_ += in[j][i-1];
_t_36_ += in[j][i-1];
_t_19_ -= in[j][i+1];
_t_36_ -= in[j][i+1];
outjp1ic0 += _t_19_ * 0.64;
_t_28_ += -in[j][i-1];
_t_28_ += in[j][i+1];
outjp2ic0 += _t_28_ * 0.16;
_t_25_ -= in[j][i-3];
_t_25_ += in[j][i+3];
_t_25_ += in[j+5][i-2];
_t_25_ -= in[j+5][i+2];
outjp2ic0 += _t_25_ * 0.00762;

_t_23_ += in[j+6][i-1];
_t_23_ -= in[j+6][i+1];
outjp2ic0 += _t_23_ * 0.002856;
_t_36_ -= in[j+6][i-1];
_t_36_ += in[j+6][i+1];
outjp3ic0 += _t_36_ * 0.03048;
outjp2ic0 += _t_29_ * 0.64;
_t_20_ -= in[j+6][i-4];
_t_20_ += in[j+6][i+4];
outjp2ic0 += _t_20_ * 1.27449;
_t_31_ += in[j+6][i-4];
_t_31_ -= in[j+6][i+4];
_t_31_ += in[j+7][i-3];
_t_31_ -= in[j+7][i+3];
outjp3ic0 += _t_31_ * 0.000136017;
_t_21_ += in[j+6][i-3];
_t_21_ -= in[j+6][i+3];
outjp2ic0 += _t_21_ * 0.000136017;
_t_34_ -= in[j+6][i-3];
_t_34_ += in[j+6][i+3];
outjp3ic0 += _t_34_ * 0.00145161;
_t_22_ -= in[j+6][i-2];
_t_22_ += in[j+6][i+2];
outjp2ic0 += _t_22_ * 0.000714;
_t_35_ += in[j+6][i-2];
_t_35_ -= in[j+6][i+2];
outjp3ic0 += _t_35_ * 0.00762;

outjp3ic0 += _t_39_ * 0.64;

out[j][i] = outjc0ic0;
out[j+1][i] = outjp1ic0;
out[j+2][i] = outjp2ic0;
out[j+3][i] = outjp3ic0;
	} 
}

extern "C" void host_code (double *h_in, double *h_out, int N) {
	double *in;
	cudaMalloc (&in, sizeof(double)*N*N);
	check_error ("Failed to allocate device memory for in\n");
	cudaMemcpy (in, h_in, sizeof(double)*N*N, cudaMemcpyHostToDevice);
	double *out;
	cudaMalloc (&out, sizeof(double)*N*N);
	check_error ("Failed to allocate device memory for out\n");

	dim3 blockconfig (16, 8);
	dim3 gridconfig (ceil(N, blockconfig.x), ceil(N, 4*blockconfig.y));

	j2d64pt<<<gridconfig, blockconfig>>> (in, out, N);

	cudaMemcpy (h_out, out, sizeof(double)*N*N, cudaMemcpyDeviceToHost);
	cudaFree (in); 
	cudaFree (out);
}
