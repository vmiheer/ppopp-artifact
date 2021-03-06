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
#pragma begin stencil1 unroll k=1,j=1,i=1
		flux_0[k][j][i] = ((0.8f*(cons_1[k][j][i+1] - cons_1[k][j][i-1]) - 0.2f*(cons_1[k][j][i+2] - cons_1[k][j][i-2]) + 0.038f*(cons_1[k][j][i+3] - cons_1[k][j][i-3]) - 0.0035f*(cons_1[k][j][i+4] - cons_1[k][j][i-4]))*dxinv0); 
		flux_1[k][j][i] = ((0.8f*(cons_1[k][j][i+1]*q_1[k][j][i+1]-cons_1[k][j][i-1]*q_1[k][j][i-1]+(q_4[k][j][i+1]-q_4[k][j][i-1]))-0.2f*(cons_1[k][j][i+2]*q_1[k][j][i+2]-cons_1[k][j][i-2]*q_1[k][j][i-2]+(q_4[k][j][i+2]-q_4[k][j][i-2]))+0.038f*(cons_1[k][j][i+3]*q_1[k][j][i+3]-cons_1[k][j][i-3]*q_1[k][j][i-3]+(q_4[k][j][i+3]-q_4[k][j][i-3]))-0.0035f*(cons_1[k][j][i+4]*q_1[k][j][i+4]-cons_1[k][j][i-4]*q_1[k][j][i-4]+(q_4[k][j][i+4]-q_4[k][j][i-4])))*dxinv0); 
		flux_2[k][j][i] = ((0.8f*(cons_2[k][j][i+1]*q_1[k][j][i+1]-cons_2[k][j][i-1]*q_1[k][j][i-1])-0.2f*(cons_2[k][j][i+2]*q_1[k][j][i+2]-cons_2[k][j][i-2]*q_1[k][j][i-2])+0.038f*(cons_2[k][j][i+3]*q_1[k][j][i+3]-cons_2[k][j][i-3]*q_1[k][j][i-3])-0.0035f*(cons_2[k][j][i+4]*q_1[k][j][i+4]-cons_2[k][j][i-4]*q_1[k][j][i-4]))*dxinv0); 
		flux_3[k][j][i] = ((0.8f*(cons_3[k][j][i+1]*q_1[k][j][i+1]-cons_3[k][j][i-1]*q_1[k][j][i-1])-0.2f*(cons_3[k][j][i+2]*q_1[k][j][i+2]-cons_3[k][j][i-2]*q_1[k][j][i-2])+0.038f*(cons_3[k][j][i+3]*q_1[k][j][i+3]-cons_3[k][j][i-3]*q_1[k][j][i-3])-0.0035f*(cons_3[k][j][i+4]*q_1[k][j][i+4]-cons_3[k][j][i-4]*q_1[k][j][i-4]))*dxinv0); 
		flux_4[k][j][i] = ((0.8f*(cons_4[k][j][i+1]*q_1[k][j][i+1]-cons_4[k][j][i-1]*q_1[k][j][i-1]+(q_4[k][j][i+1]*q_1[k][j][i+1]-q_4[k][j][i-1]*q_1[k][j][i-1]))-0.2f*(cons_4[k][j][i+2]*q_1[k][j][i+2]-cons_4[k][j][i-2]*q_1[k][j][i-2]+(q_4[k][j][i+2]*q_1[k][j][i+2]-q_4[k][j][i-2]*q_1[k][j][i-2]))+0.038f*(cons_4[k][j][i+3]*q_1[k][j][i+3]-cons_4[k][j][i-3]*q_1[k][j][i-3]+(q_4[k][j][i+3]*q_1[k][j][i+3]-q_4[k][j][i-3]*q_1[k][j][i-3]))-0.0035f*(cons_4[k][j][i+4]*q_1[k][j][i+4]-cons_4[k][j][i-4]*q_1[k][j][i-4]+(q_4[k][j][i+4]*q_1[k][j][i+4]-q_4[k][j][i-4]*q_1[k][j][i-4])))*dxinv0); 

		flux_0[k][j][i] -= ((0.8f*(cons_2[k][j+1][i] - cons_2[k][j-1][i]) - 0.2f*(cons_2[k][j+2][i] - cons_2[k][j-2][i]) + 0.038f*(cons_2[k][j+3][i] - cons_2[k][j-3][i]) - 0.0035f*(cons_2[k][j+4][i] - cons_2[k][j-4][i]))*dxinv1); 
		flux_1[k][j][i] -= (0.8f*(cons_1[k][j+1][i]*q_2[k][j+1][i]-cons_1[k][j-1][i]*q_2[k][j-1][i])-0.2f*(cons_1[k][j+2][i]*q_2[k][j+2][i]-cons_1[k][j-2][i]*q_2[k][j-2][i])+0.038f*(cons_1[k][j+3][i]*q_2[k][j+3][i]-cons_1[k][j-3][i]*q_2[k][j-3][i])-0.0035f*(cons_1[k][j+4][i]*q_2[k][j+4][i]-cons_1[k][j-4][i]*q_2[k][j-4][i]))*dxinv1; 
		flux_2[k][j][i] -= (0.8f*(cons_2[k][j+1][i]*q_2[k][j+1][i]-cons_2[k][j-1][i]*q_2[k][j-1][i]+(q_4[k][j+1][i]-q_4[k][j-1][i]))-0.2f*(cons_2[k][j+2][i]*q_2[k][j+2][i]-cons_2[k][j-2][i]*q_2[k][j-2][i]+(q_4[k][j+2][i]-q_4[k][j-2][i]))+0.038f*(cons_2[k][j+3][i]*q_2[k][j+3][i]-cons_2[k][j-3][i]*q_2[k][j-3][i]+(q_4[k][j+3][i]-q_4[k][j-3][i]))-0.0035f*(cons_2[k][j+4][i]*q_2[k][j+4][i]-cons_2[k][j-4][i]*q_2[k][j-4][i]+(q_4[k][j+4][i]-q_4[k][j-4][i])))*dxinv1; 
		flux_3[k][j][i] -= (0.8f*(cons_3[k][j+1][i]*q_2[k][j+1][i]-cons_3[k][j-1][i]*q_2[k][j-1][i])-0.2f*(cons_3[k][j+2][i]*q_2[k][j+2][i]-cons_3[k][j-2][i]*q_2[k][j-2][i])+0.038f*(cons_3[k][j+3][i]*q_2[k][j+3][i]-cons_3[k][j-3][i]*q_2[k][j-3][i])-0.0035f*(cons_3[k][j+4][i]*q_2[k][j+4][i]-cons_3[k][j-4][i]*q_2[k][j-4][i]))*dxinv1; 
		flux_4[k][j][i] -= (0.8f*(cons_4[k][j+1][i]*q_2[k][j+1][i]-cons_4[k][j-1][i]*q_2[k][j-1][i]+(q_4[k][j+1][i]*q_2[k][j+1][i]-q_4[k][j-1][i]*q_2[k][j-1][i]))-0.2f*(cons_4[k][j+2][i]*q_2[k][j+2][i]-cons_4[k][j-2][i]*q_2[k][j-2][i]+(q_4[k][j+2][i]*q_2[k][j+2][i]-q_4[k][j-2][i]*q_2[k][j-2][i]))+0.038f*(cons_4[k][j+3][i]*q_2[k][j+3][i]-cons_4[k][j-3][i]*q_2[k][j-3][i]+(q_4[k][j+3][i]*q_2[k][j+3][i]-q_4[k][j-3][i]*q_2[k][j-3][i]))-0.0035f*(cons_4[k][j+4][i]*q_2[k][j+4][i]-cons_4[k][j-4][i]*q_2[k][j-4][i]+(q_4[k][j+4][i]*q_2[k][j+4][i]-q_4[k][j-4][i]*q_2[k][j-4][i])))*dxinv1; 
#pragma end stencil1

		flux_0[k][j][i] -= ((0.8f*(cons_3[k+1][j][i] - cons_3[k-1][j][i]) - 0.2f*(cons_3[k+2][j][i] - cons_3[k-2][j][i]) + 0.038f*(cons_3[k+3][j][i] - cons_3[k-3][j][i]) - 0.0035f*(cons_3[k+4][j][i] - cons_3[k-4][j][i]))*dxinv2); 
		flux_1[k][j][i] -= (0.8f*(cons_1[k+1][j][i]*q_3[k+1][j][i]-cons_1[k-1][j][i]*q_3[k-1][j][i])-0.2f*(cons_1[k+2][j][i]*q_3[k+2][j][i]-cons_1[k-2][j][i]*q_3[k-2][j][i])+0.038f*(cons_1[k+3][j][i]*q_3[k+3][j][i]-cons_1[k-3][j][i]*q_3[k-3][j][i])-0.0035f*(cons_1[k+4][j][i]*q_3[k+4][j][i]-cons_1[k-4][j][i]*q_3[k-4][j][i]))*dxinv2; 
		flux_2[k][j][i] -= (0.8f*(cons_2[k+1][j][i]*q_3[k+1][j][i]-cons_2[k-1][j][i]*q_3[k-1][j][i])-0.2f*(cons_2[k+2][j][i]*q_3[k+2][j][i]-cons_2[k-2][j][i]*q_3[k-2][j][i])+0.038f*(cons_2[k+3][j][i]*q_3[k+3][j][i]-cons_2[k-3][j][i]*q_3[k-3][j][i])-0.0035f*(cons_2[k+4][j][i]*q_3[k+4][j][i]-cons_2[k-4][j][i]*q_3[k-4][j][i]))*dxinv2; 
		flux_3[k][j][i] -= (0.8f*(cons_3[k+1][j][i]*q_3[k+1][j][i]-cons_3[k-1][j][i]*q_3[k-1][j][i]+(q_4[k+1][j][i]-q_4[k-1][j][i]))-0.2f*(cons_3[k+2][j][i]*q_3[k+2][j][i]-cons_3[k-2][j][i]*q_3[k-2][j][i]+(q_4[k+2][j][i]-q_4[k-2][j][i]))+0.038f*(cons_3[k+3][j][i]*q_3[k+3][j][i]-cons_3[k-3][j][i]*q_3[k-3][j][i]+(q_4[k+3][j][i]-q_4[k-3][j][i]))-0.0035f*(cons_3[k+4][j][i]*q_3[k+4][j][i]-cons_3[k-4][j][i]*q_3[k-4][j][i]+(q_4[k+4][j][i]-q_4[k-4][j][i])))*dxinv2; 
		flux_4[k][j][i] -= (0.8f*(cons_4[k+1][j][i]*q_3[k+1][j][i]-cons_4[k-1][j][i]*q_3[k-1][j][i]+(q_4[k+1][j][i]*q_3[k+1][j][i]-q_4[k-1][j][i]*q_3[k-1][j][i]))-0.2f*(cons_4[k+2][j][i]*q_3[k+2][j][i]-cons_4[k-2][j][i]*q_3[k-2][j][i]+(q_4[k+2][j][i]*q_3[k+2][j][i]-q_4[k-2][j][i]*q_3[k-2][j][i]))+0.038f*(cons_4[k+3][j][i]*q_3[k+3][j][i]-cons_4[k-3][j][i]*q_3[k-3][j][i]+(q_4[k+3][j][i]*q_3[k+3][j][i]-q_4[k-3][j][i]*q_3[k-3][j][i]))-0.0035f*(cons_4[k+4][j][i]*q_3[k+4][j][i]-cons_4[k-4][j][i]*q_3[k-4][j][i]+(q_4[k+4][j][i]*q_3[k+4][j][i]-q_4[k-4][j][i]*q_3[k-4][j][i])))*dxinv2; 
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
