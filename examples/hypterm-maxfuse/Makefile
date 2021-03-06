NVCC=nvcc
NVPROF=nvprof
NOPTFLAGS=-O3 -ccbin=g++ -std=c++11 -Xcompiler "-fPIC -fopenmp -O3 -fno-strict-aliasing" --use_fast_math -Xptxas "-dlcm=ca"
NCOMPUTEFLAGS=-gencode arch=compute_$(CAPABILITY),code=sm_$(CAPABILITY) 
CLANG=clang++
LOPTFLAGS=-O3 -ffp-contract=fast --cuda-path=$(CUDAHOME) -L$(CUDAHOME)/lib64 -L$(CUDAHOME)/nvvm -lcudart
LCOMPUTEFLAGS=--cuda-gpu-arch=sm_$(CAPABILITY)

all:
	#./reorder-max.sh hypterm-reg-maxfuse.cu
	#./reorder.sh hypterm-reg.cu
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp hypterm-orig.cu -o nvcc-orig
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-a.cu -o nvcc-max-reorder-a
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-b.cu -o nvcc-max-reorder-b
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-c.cu -o nvcc-max-reorder-c
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-d.cu -o nvcc-max-reorder-d
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-e.cu -o nvcc-max-reorder-e
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-f.cu -o nvcc-max-reorder-f
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-g.cu -o nvcc-max-reorder-g
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-h.cu -o nvcc-max-reorder-h
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-i.cu -o nvcc-max-reorder-i
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-j.cu -o nvcc-max-reorder-j
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-k.cu -o nvcc-max-reorder-k
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-l.cu -o nvcc-max-reorder-l
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp hypterm-orig.cu -o llvm-orig
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-a.cu -o llvm-max-reorder-a
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-b.cu -o llvm-max-reorder-b 
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-c.cu -o llvm-max-reorder-c
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-d.cu -o llvm-max-reorder-d
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-e.cu -o llvm-max-reorder-e
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-f.cu -o llvm-max-reorder-f
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-g.cu -o llvm-max-reorder-g
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-h.cu -o llvm-max-reorder-h
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-i.cu -o llvm-max-reorder-i
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-j.cu -o llvm-max-reorder-j
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-k.cu -o llvm-max-reorder-k
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp max-reordered-l.cu -o llvm-max-reorder-l
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-a.cu -o nvcc-reorder-a
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-b.cu -o nvcc-reorder-b
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-c.cu -o nvcc-reorder-c
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-d.cu -o nvcc-reorder-d
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-e.cu -o nvcc-reorder-e
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-f.cu -o nvcc-reorder-f
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-g.cu -o nvcc-reorder-g
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-h.cu -o nvcc-reorder-h
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-i.cu -o nvcc-reorder-i
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-j.cu -o nvcc-reorder-j
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-k.cu -o nvcc-reorder-k
	$(NVCC) $(NOPTFLAGS) $(NCOMPUTEFLAGS) -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-l.cu -o nvcc-reorder-l
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp hypterm-orig.cu -o llvm-orig
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-a.cu -o llvm-reorder-a
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-b.cu -o llvm-reorder-b 
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-c.cu -o llvm-reorder-c
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-d.cu -o llvm-reorder-d
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-e.cu -o llvm-reorder-e
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-f.cu -o llvm-reorder-f
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-g.cu -o llvm-reorder-g
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-h.cu -o llvm-reorder-h
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-i.cu -o llvm-reorder-i
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-j.cu -o llvm-reorder-j
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-k.cu -o llvm-reorder-k
	$(CLANG) $(LOPTFLAGS) $(LCOMPUTEFLAGS) -Xcuda-ptxas -maxrregcount=128 common/cuda_header.cu hypterm.driver.cpp hypterm_gold.cpp reordered-l.cu -o llvm-reorder-l
	$(NVPROF) --print-gpu-trace ./nvcc-orig > /dev/null 2>nvcc-orig-results
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-a > /dev/null 2>nvcc-max-reorder-results-a
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-b > /dev/null 2>nvcc-max-reorder-results-b
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-c > /dev/null 2>nvcc-max-reorder-results-c
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-d > /dev/null 2>nvcc-max-reorder-results-d
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-e > /dev/null 2>nvcc-max-reorder-results-e
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-f > /dev/null 2>nvcc-max-reorder-results-f
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-g > /dev/null 2>nvcc-max-reorder-results-g
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-h > /dev/null 2>nvcc-max-reorder-results-h
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-i > /dev/null 2>nvcc-max-reorder-results-i
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-j > /dev/null 2>nvcc-max-reorder-results-j
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-k > /dev/null 2>nvcc-max-reorder-results-k
	$(NVPROF) --print-gpu-trace ./nvcc-max-reorder-l > /dev/null 2>nvcc-max-reorder-results-l
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-a > /dev/null 2>nvcc-reorder-results-a
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-b > /dev/null 2>nvcc-reorder-results-b
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-c > /dev/null 2>nvcc-reorder-results-c
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-d > /dev/null 2>nvcc-reorder-results-d
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-e > /dev/null 2>nvcc-reorder-results-e
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-f > /dev/null 2>nvcc-reorder-results-f
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-g > /dev/null 2>nvcc-reorder-results-g
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-h > /dev/null 2>nvcc-reorder-results-h
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-i > /dev/null 2>nvcc-reorder-results-i
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-j > /dev/null 2>nvcc-reorder-results-j
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-k > /dev/null 2>nvcc-reorder-results-k
	$(NVPROF) --print-gpu-trace ./nvcc-reorder-l > /dev/null 2>nvcc-reorder-results-l
	$(NVPROF) --print-gpu-trace ./llvm-orig > /dev/null 2>llvm-orig-results
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-a > /dev/null 2>llvm-max-reorder-results-a
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-b > /dev/null 2>llvm-max-reorder-results-b
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-c > /dev/null 2>llvm-max-reorder-results-c
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-d > /dev/null 2>llvm-max-reorder-results-d
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-e > /dev/null 2>llvm-max-reorder-results-e
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-f > /dev/null 2>llvm-max-reorder-results-f
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-g > /dev/null 2>llvm-max-reorder-results-g
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-h > /dev/null 2>llvm-max-reorder-results-h
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-i > /dev/null 2>llvm-max-reorder-results-i
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-j > /dev/null 2>llvm-max-reorder-results-j
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-k > /dev/null 2>llvm-max-reorder-results-k
	$(NVPROF) --print-gpu-trace ./llvm-max-reorder-l > /dev/null 2>llvm-max-reorder-results-l
	$(NVPROF) --print-gpu-trace ./llvm-reorder-a > /dev/null 2>llvm-reorder-results-a
	$(NVPROF) --print-gpu-trace ./llvm-reorder-b > /dev/null 2>llvm-reorder-results-b
	$(NVPROF) --print-gpu-trace ./llvm-reorder-c > /dev/null 2>llvm-reorder-results-c
	$(NVPROF) --print-gpu-trace ./llvm-reorder-d > /dev/null 2>llvm-reorder-results-d
	$(NVPROF) --print-gpu-trace ./llvm-reorder-e > /dev/null 2>llvm-reorder-results-e
	$(NVPROF) --print-gpu-trace ./llvm-reorder-f > /dev/null 2>llvm-reorder-results-f
	$(NVPROF) --print-gpu-trace ./llvm-reorder-g > /dev/null 2>llvm-reorder-results-g
	$(NVPROF) --print-gpu-trace ./llvm-reorder-h > /dev/null 2>llvm-reorder-results-h
	$(NVPROF) --print-gpu-trace ./llvm-reorder-i > /dev/null 2>llvm-reorder-results-i
	$(NVPROF) --print-gpu-trace ./llvm-reorder-j > /dev/null 2>llvm-reorder-results-j
	$(NVPROF) --print-gpu-trace ./llvm-reorder-k > /dev/null 2>llvm-reorder-results-k
	$(NVPROF) --print-gpu-trace ./llvm-reorder-l > /dev/null 2>llvm-reorder-results-l
	./common/time.awk

clean:
	rm test nvcc-* llvm-* *.idsl stencils stencilnames unrollfactors 2>/dev/null || true 
