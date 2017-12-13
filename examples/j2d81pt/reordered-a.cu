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

__global__ void j2d81pt (double * __restrict__ l_in, double * __restrict__ l_out, int N) {
	//Determing the block's indices
	int i0 = (int)(blockIdx.x)*(int)(blockDim.x);
	int i = max(i0,0) + (int)(threadIdx.x);
	int j0 = 4*(int)(blockIdx.y)*(int)(blockDim.y);
	int j = max(j0,0) + 4*(int)(threadIdx.y);

	double (*in)[8200] = (double (*)[8200]) l_in;
	double (*out)[8200] = (double (*)[8200]) l_out;

	if (i>=0 & j>=0 & i<=N-9 & j<=N-9) {
double outjc0ic0 = 3.18622 * in[j][i];
outjc0ic0 += 3.18622 * in[j][i+8];
outjc0ic0 += 4.5339 * in[j][i+1];
outjc0ic0 += 4.5339 * in[j][i+7];
outjc0ic0 += -0.000357 * in[j][i+2];
outjc0ic0 += -0.000357 * in[j][i+6];
outjc0ic0 += 0.002856 * in[j][i+3];
outjc0ic0 += 0.002856 * in[j][i+5];
outjc0ic0 += -0.00508225 * in[j][i+4];
outjc0ic0 += 3.18622 * in[j+8][i];
double outjp1ic0 = 4.5339 * in[j+8][i];
double outjp2ic0 = -0.000357 * in[j+8][i];
double outjp3ic0 = 0.002856 * in[j+8][i];
outjc0ic0 += 3.18622 * in[j+8][i+8];
outjp1ic0 += 4.5339 * in[j+8][i+8];
outjp2ic0 += -0.000357 * in[j+8][i+8];
outjp3ic0 += 0.002856 * in[j+8][i+8];
outjc0ic0 += 4.5339 * in[j+1][i];
outjp1ic0 += 3.18622 * in[j+1][i];
outjc0ic0 += 4.5339 * in[j+1][i+8];
outjp1ic0 += 3.18622 * in[j+1][i+8];
outjc0ic0 += 4.5339 * in[j+7][i];
outjp1ic0 += -0.000357 * in[j+7][i];
outjp2ic0 += 0.002856 * in[j+7][i];
outjp3ic0 += -0.00508225 * in[j+7][i];
outjc0ic0 += 4.5339 * in[j+7][i+8];
outjp1ic0 += -0.000357 * in[j+7][i+8];
outjp2ic0 += 0.002856 * in[j+7][i+8];
outjp3ic0 += -0.00508225 * in[j+7][i+8];
outjc0ic0 += 4.5339 * in[j+8][i+1];
outjp1ic0 += 0.00064516 * in[j+8][i+1];
outjp2ic0 += -0.00508 * in[j+8][i+1];
outjp3ic0 += 0.04064 * in[j+8][i+1];
outjc0ic0 += 4.5339 * in[j+8][i+7];
outjp1ic0 += 0.00064516 * in[j+8][i+7];
outjp2ic0 += -0.00508 * in[j+8][i+7];
outjp3ic0 += 0.04064 * in[j+8][i+7];
outjc0ic0 += -0.000357 * in[j+2][i];
outjp1ic0 += 4.5339 * in[j+2][i];
outjp2ic0 += 3.18622 * in[j+2][i];
outjc0ic0 += -0.000357 * in[j+2][i+8];
outjp1ic0 += 4.5339 * in[j+2][i+8];
outjp2ic0 += 3.18622 * in[j+2][i+8];
outjc0ic0 += -0.000357 * in[j+6][i];
outjp1ic0 += 0.002856 * in[j+6][i];
outjp2ic0 += -0.00508225 * in[j+6][i];
outjp3ic0 += 0.002856 * in[j+6][i];
outjc0ic0 += -0.000357 * in[j+6][i+8];
outjp1ic0 += 0.002856 * in[j+6][i+8];
outjp2ic0 += -0.00508225 * in[j+6][i+8];
outjp3ic0 += 0.002856 * in[j+6][i+8];
outjc0ic0 += -0.000357 * in[j+8][i+2];
outjp1ic0 += -0.00508 * in[j+8][i+2];
outjp2ic0 += 0.04 * in[j+8][i+2];
outjp3ic0 += -0.32 * in[j+8][i+2];
outjc0ic0 += -0.000357 * in[j+8][i+6];
outjp1ic0 += -0.00508 * in[j+8][i+6];
outjp2ic0 += 0.04 * in[j+8][i+6];
outjp3ic0 += -0.32 * in[j+8][i+6];
outjc0ic0 += 0.002856 * in[j+3][i];
outjp1ic0 += -0.000357 * in[j+3][i];
outjp2ic0 += 4.5339 * in[j+3][i];
outjp3ic0 += 3.18622 * in[j+3][i];
outjc0ic0 += 0.002856 * in[j+3][i+8];
outjp1ic0 += -0.000357 * in[j+3][i+8];
outjp2ic0 += 4.5339 * in[j+3][i+8];
outjp3ic0 += 3.18622 * in[j+3][i+8];
outjc0ic0 += 0.002856 * in[j+5][i];
outjp1ic0 += -0.00508225 * in[j+5][i];
outjp2ic0 += 0.002856 * in[j+5][i];
outjp3ic0 += -0.000357 * in[j+5][i];
outjc0ic0 += 0.002856 * in[j+5][i+8];
outjp1ic0 += -0.00508225 * in[j+5][i+8];
outjp2ic0 += 0.002856 * in[j+5][i+8];
outjp3ic0 += -0.000357 * in[j+5][i+8];
outjc0ic0 += 0.002856 * in[j+8][i+3];
outjp1ic0 += 0.04064 * in[j+8][i+3];
outjp2ic0 += -0.32 * in[j+8][i+3];
outjp3ic0 += 2.56 * in[j+8][i+3];
outjc0ic0 += 0.002856 * in[j+8][i+5];
outjp1ic0 += 0.04064 * in[j+8][i+5];
outjp2ic0 += -0.32 * in[j+8][i+5];
outjp3ic0 += 2.56 * in[j+8][i+5];
outjc0ic0 += -0.00508225 * in[j+4][i+8];
outjp1ic0 += 0.002856 * in[j+4][i+8];
outjp2ic0 += -0.000357 * in[j+4][i+8];
outjp3ic0 += 4.5339 * in[j+4][i+8];
outjc0ic0 += -0.00508225 * in[j+4][i];
outjp1ic0 += 0.002856 * in[j+4][i];
outjp2ic0 += -0.000357 * in[j+4][i];
outjp3ic0 += 4.5339 * in[j+4][i];
outjc0ic0 += -0.00508225 * in[j+8][i+4];
outjp1ic0 += -0.0723189 * in[j+8][i+4];
outjp2ic0 += 0.56944 * in[j+8][i+4];
outjp3ic0 += -4.55552 * in[j+8][i+4];
outjc0ic0 += 0.00064516 * in[j+1][i+1];
outjp1ic0 += 4.5339 * in[j+1][i+1];
outjc0ic0 += 0.00064516 * in[j+1][i+7];
outjp1ic0 += 4.5339 * in[j+1][i+7];
outjc0ic0 += 0.00064516 * in[j+7][i+1];
outjp1ic0 += -0.00508 * in[j+7][i+1];
outjp2ic0 += 0.04064 * in[j+7][i+1];
outjp3ic0 += -0.0723189 * in[j+7][i+1];
outjc0ic0 += 0.00064516 * in[j+7][i+7];
outjp1ic0 += -0.00508 * in[j+7][i+7];
outjp2ic0 += 0.04064 * in[j+7][i+7];
outjp3ic0 += -0.0723189 * in[j+7][i+7];
outjc0ic0 += -0.00508 * in[j+1][i+2];
outjp1ic0 += -0.000357 * in[j+1][i+2];
outjc0ic0 += -0.00508 * in[j+1][i+6];
outjp1ic0 += -0.000357 * in[j+1][i+6];
outjc0ic0 += -0.00508 * in[j+2][i+1];
outjp1ic0 += 0.00064516 * in[j+2][i+1];
outjp2ic0 += 4.5339 * in[j+2][i+1];
outjc0ic0 += -0.00508 * in[j+2][i+7];
outjp1ic0 += 0.00064516 * in[j+2][i+7];
outjp2ic0 += 4.5339 * in[j+2][i+7];
outjc0ic0 += -0.00508 * in[j+6][i+1];
outjp1ic0 += 0.04064 * in[j+6][i+1];
outjp2ic0 += -0.0723189 * in[j+6][i+1];
outjp3ic0 += 0.04064 * in[j+6][i+1];
outjc0ic0 += -0.00508 * in[j+6][i+7];
outjp1ic0 += 0.04064 * in[j+6][i+7];
outjp2ic0 += -0.0723189 * in[j+6][i+7];
outjp3ic0 += 0.04064 * in[j+6][i+7];
outjc0ic0 += -0.00508 * in[j+7][i+2];
outjp1ic0 += 0.04 * in[j+7][i+2];
outjp2ic0 += -0.32 * in[j+7][i+2];
outjp3ic0 += 0.56944 * in[j+7][i+2];
outjc0ic0 += -0.00508 * in[j+7][i+6];
outjp1ic0 += 0.04 * in[j+7][i+6];
outjp2ic0 += -0.32 * in[j+7][i+6];
outjp3ic0 += 0.56944 * in[j+7][i+6];
outjc0ic0 += 0.04064 * in[j+1][i+3];
outjp1ic0 += 0.002856 * in[j+1][i+3];
outjc0ic0 += 0.04064 * in[j+1][i+5];
outjp1ic0 += 0.002856 * in[j+1][i+5];
outjc0ic0 += 0.04064 * in[j+3][i+1];
outjp1ic0 += -0.00508 * in[j+3][i+1];
outjp2ic0 += 0.00064516 * in[j+3][i+1];
outjp3ic0 += 4.5339 * in[j+3][i+1];
outjc0ic0 += 0.04064 * in[j+3][i+7];
outjp1ic0 += -0.00508 * in[j+3][i+7];
outjp2ic0 += 0.00064516 * in[j+3][i+7];
outjp3ic0 += 4.5339 * in[j+3][i+7];
outjc0ic0 += 0.04064 * in[j+5][i+1];
outjp1ic0 += -0.0723189 * in[j+5][i+1];
outjp2ic0 += 0.04064 * in[j+5][i+1];
outjp3ic0 += -0.00508 * in[j+5][i+1];
outjc0ic0 += 0.04064 * in[j+5][i+7];
outjp1ic0 += -0.0723189 * in[j+5][i+7];
outjp2ic0 += 0.04064 * in[j+5][i+7];
outjp3ic0 += -0.00508 * in[j+5][i+7];
outjc0ic0 += 0.04064 * in[j+7][i+3];
outjp1ic0 += -0.32 * in[j+7][i+3];
outjp2ic0 += 2.56 * in[j+7][i+3];
outjp3ic0 += -4.55552 * in[j+7][i+3];
outjc0ic0 += 0.04064 * in[j+7][i+5];
outjp1ic0 += -0.32 * in[j+7][i+5];
outjp2ic0 += 2.56 * in[j+7][i+5];
outjp3ic0 += -4.55552 * in[j+7][i+5];
outjc0ic0 += -0.0723189 * in[j+1][i+4];
outjp1ic0 += -0.00508225 * in[j+1][i+4];
outjc0ic0 += -0.0723189 * in[j+4][i+1];
outjp1ic0 += 0.04064 * in[j+4][i+1];
outjp2ic0 += -0.00508 * in[j+4][i+1];
outjp3ic0 += 0.00064516 * in[j+4][i+1];
outjc0ic0 += -0.0723189 * in[j+4][i+7];
outjp1ic0 += 0.04064 * in[j+4][i+7];
outjp2ic0 += -0.00508 * in[j+4][i+7];
outjp3ic0 += 0.00064516 * in[j+4][i+7];
outjc0ic0 += -0.0723189 * in[j+7][i+4];
outjp1ic0 += 0.56944 * in[j+7][i+4];
outjp2ic0 += -4.55552 * in[j+7][i+4];
outjp3ic0 += in[j+7][i+4] * 8.10655;
outjc0ic0 += 0.04 * in[j+2][i+2];
outjp1ic0 += -0.00508 * in[j+2][i+2];
outjp2ic0 += -0.000357 * in[j+2][i+2];
outjc0ic0 += 0.04 * in[j+2][i+6];
outjp1ic0 += -0.00508 * in[j+2][i+6];
outjp2ic0 += -0.000357 * in[j+2][i+6];
outjc0ic0 += 0.04 * in[j+6][i+2];
outjp1ic0 += -0.32 * in[j+6][i+2];
outjp2ic0 += 0.56944 * in[j+6][i+2];
outjp3ic0 += -0.32 * in[j+6][i+2];
outjc0ic0 += 0.04 * in[j+6][i+6];
outjp1ic0 += -0.32 * in[j+6][i+6];
outjp2ic0 += 0.56944 * in[j+6][i+6];
outjp3ic0 += -0.32 * in[j+6][i+6];
outjc0ic0 += -0.32 * in[j+2][i+3];
outjp1ic0 += 0.04064 * in[j+2][i+3];
outjp2ic0 += 0.002856 * in[j+2][i+3];
outjc0ic0 += -0.32 * in[j+2][i+5];
outjp1ic0 += 0.04064 * in[j+2][i+5];
outjp2ic0 += 0.002856 * in[j+2][i+5];
outjc0ic0 += -0.32 * in[j+3][i+2];
outjp1ic0 += 0.04 * in[j+3][i+2];
outjp2ic0 += -0.00508 * in[j+3][i+2];
outjp3ic0 += -0.000357 * in[j+3][i+2];
outjc0ic0 += -0.32 * in[j+3][i+6];
outjp1ic0 += 0.04 * in[j+3][i+6];
outjp2ic0 += -0.00508 * in[j+3][i+6];
outjp3ic0 += -0.000357 * in[j+3][i+6];
outjc0ic0 += -0.32 * in[j+5][i+2];
outjp1ic0 += 0.56944 * in[j+5][i+2];
outjp2ic0 += -0.32 * in[j+5][i+2];
outjp3ic0 += 0.04 * in[j+5][i+2];
outjc0ic0 += -0.32 * in[j+5][i+6];
outjp1ic0 += 0.56944 * in[j+5][i+6];
outjp2ic0 += -0.32 * in[j+5][i+6];
outjp3ic0 += 0.04 * in[j+5][i+6];
outjc0ic0 += -0.32 * in[j+6][i+3];
outjp1ic0 += 2.56 * in[j+6][i+3];
outjp2ic0 += -4.55552 * in[j+6][i+3];
outjp3ic0 += 2.56 * in[j+6][i+3];
outjc0ic0 += -0.32 * in[j+6][i+5];
outjp1ic0 += 2.56 * in[j+6][i+5];
outjp2ic0 += -4.55552 * in[j+6][i+5];
outjp3ic0 += 2.56 * in[j+6][i+5];
outjc0ic0 += 0.56944 * in[j+2][i+4];
outjp1ic0 += -0.0723189 * in[j+2][i+4];
outjp2ic0 += -0.00508225 * in[j+2][i+4];
outjc0ic0 += 0.56944 * in[j+4][i+2];
outjp1ic0 += -0.32 * in[j+4][i+2];
outjp2ic0 += 0.04 * in[j+4][i+2];
outjp3ic0 += -0.00508 * in[j+4][i+2];
outjc0ic0 += 0.56944 * in[j+4][i+6];
outjp1ic0 += -0.32 * in[j+4][i+6];
outjp2ic0 += 0.04 * in[j+4][i+6];
outjp3ic0 += -0.00508 * in[j+4][i+6];
outjc0ic0 += 0.56944 * in[j+6][i+4];
outjp1ic0 += -4.55552 * in[j+6][i+4];
outjp2ic0 += in[j+6][i+4] * 8.10655;
outjp3ic0 += -4.55552 * in[j+6][i+4];
outjc0ic0 += 2.56 * in[j+3][i+3];
outjp1ic0 += -0.32 * in[j+3][i+3];
outjp2ic0 += 0.04064 * in[j+3][i+3];
outjp3ic0 += 0.002856 * in[j+3][i+3];
outjc0ic0 += 2.56 * in[j+3][i+5];
outjp1ic0 += -0.32 * in[j+3][i+5];
outjp2ic0 += 0.04064 * in[j+3][i+5];
outjp3ic0 += 0.002856 * in[j+3][i+5];
outjc0ic0 += 2.56 * in[j+5][i+3];
outjp1ic0 += -4.55552 * in[j+5][i+3];
outjp2ic0 += 2.56 * in[j+5][i+3];
outjp3ic0 += -0.32 * in[j+5][i+3];
outjc0ic0 += 2.56 * in[j+5][i+5];
outjp1ic0 += -4.55552 * in[j+5][i+5];
outjp2ic0 += 2.56 * in[j+5][i+5];
outjp3ic0 += -0.32 * in[j+5][i+5];
outjc0ic0 += -4.55552 * in[j+3][i+4];
outjp1ic0 += 0.56944 * in[j+3][i+4];
outjp2ic0 += -0.0723189 * in[j+3][i+4];
outjp3ic0 += -0.00508225 * in[j+3][i+4];
outjc0ic0 += -4.55552 * in[j+4][i+3];
outjp1ic0 += 2.56 * in[j+4][i+3];
outjp2ic0 += -0.32 * in[j+4][i+3];
outjp3ic0 += 0.04064 * in[j+4][i+3];
outjc0ic0 += -4.55552 * in[j+4][i+5];
outjp1ic0 += 2.56 * in[j+4][i+5];
outjp2ic0 += -0.32 * in[j+4][i+5];
outjp3ic0 += 0.04064 * in[j+4][i+5];
outjc0ic0 += -4.55552 * in[j+5][i+4];
outjp1ic0 += in[j+5][i+4] * 8.10655;
outjp2ic0 += -4.55552 * in[j+5][i+4];
outjp3ic0 += 0.56944 * in[j+5][i+4];
outjc0ic0 += in[j+4][i+4] * 8.10655;
outjp1ic0 += -4.55552 * in[j+4][i+4];
outjp2ic0 += 0.56944 * in[j+4][i+4];
outjp3ic0 += -0.0723189 * in[j+4][i+4];

outjp1ic0 += 3.18622 * in[j+9][i];
outjp2ic0 += 4.5339 * in[j+9][i];
outjp3ic0 += -0.000357 * in[j+9][i];
outjp1ic0 += 3.18622 * in[j+9][i+8];
outjp2ic0 += 4.5339 * in[j+9][i+8];
outjp3ic0 += -0.000357 * in[j+9][i+8];
outjp1ic0 += 4.5339 * in[j+9][i+1];
outjp2ic0 += 0.00064516 * in[j+9][i+1];
outjp3ic0 += -0.00508 * in[j+9][i+1];
outjp1ic0 += 4.5339 * in[j+9][i+7];
outjp2ic0 += 0.00064516 * in[j+9][i+7];
outjp3ic0 += -0.00508 * in[j+9][i+7];
outjp1ic0 += -0.000357 * in[j+9][i+2];
outjp2ic0 += -0.00508 * in[j+9][i+2];
outjp3ic0 += 0.04 * in[j+9][i+2];
outjp1ic0 += -0.000357 * in[j+9][i+6];
outjp2ic0 += -0.00508 * in[j+9][i+6];
outjp3ic0 += 0.04 * in[j+9][i+6];
outjp1ic0 += 0.002856 * in[j+9][i+3];
outjp2ic0 += 0.04064 * in[j+9][i+3];
outjp3ic0 += -0.32 * in[j+9][i+3];
outjp1ic0 += 0.002856 * in[j+9][i+5];
outjp2ic0 += 0.04064 * in[j+9][i+5];
outjp3ic0 += -0.32 * in[j+9][i+5];
outjp1ic0 += -0.00508225 * in[j+9][i+4];
outjp2ic0 += -0.0723189 * in[j+9][i+4];
outjp3ic0 += 0.56944 * in[j+9][i+4];

outjp2ic0 += 3.18622 * in[j+10][i];
outjp3ic0 += 4.5339 * in[j+10][i];
outjp2ic0 += 3.18622 * in[j+10][i+8];
outjp3ic0 += 4.5339 * in[j+10][i+8];
outjp2ic0 += 4.5339 * in[j+10][i+1];
outjp3ic0 += 0.00064516 * in[j+10][i+1];
outjp2ic0 += 4.5339 * in[j+10][i+7];
outjp3ic0 += 0.00064516 * in[j+10][i+7];
outjp2ic0 += -0.000357 * in[j+10][i+2];
outjp3ic0 += -0.00508 * in[j+10][i+2];
outjp2ic0 += -0.000357 * in[j+10][i+6];
outjp3ic0 += -0.00508 * in[j+10][i+6];
outjp2ic0 += 0.002856 * in[j+10][i+3];
outjp3ic0 += 0.04064 * in[j+10][i+3];
outjp2ic0 += 0.002856 * in[j+10][i+5];
outjp3ic0 += 0.04064 * in[j+10][i+5];
outjp2ic0 += -0.00508225 * in[j+10][i+4];
outjp3ic0 += -0.0723189 * in[j+10][i+4];

outjp3ic0 += 3.18622 * in[j+11][i];
outjp3ic0 += 3.18622 * in[j+11][i+8];
outjp3ic0 += 4.5339 * in[j+11][i+1];
outjp3ic0 += 4.5339 * in[j+11][i+7];
outjp3ic0 += -0.000357 * in[j+11][i+2];
outjp3ic0 += -0.000357 * in[j+11][i+6];
outjp3ic0 += 0.002856 * in[j+11][i+3];
outjp3ic0 += 0.002856 * in[j+11][i+5];
outjp3ic0 += -0.00508225 * in[j+11][i+4];

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

	j2d81pt<<<gridconfig, blockconfig>>> (in, out, N);

	cudaMemcpy (h_out, out, sizeof(double)*N*N, cudaMemcpyDeviceToHost);
	cudaFree (in); 
	cudaFree (out);
}
