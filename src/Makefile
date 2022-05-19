CXX           = mpiicpc
CC            = mpiicc
GCC           = mpigxx
INTEL_DIR     = /opt/intel/oneapi
CXXFLAGS      = -Wall \
                -Wextra \
                -Wconversion \
                -no-inline-max-size \
                -no-inline-max-total-size \
                -g3 \
                -O3 \
                -qopenmp \
                -qopt-report-embed \
                -qoverride-limits \
                -D_LINUX \
                -DMKL_ILP64 \
                -D_USE_OMP \
                -I${INTEL_DIR}/compiler/2022.1.0/linux/compiler/include \
                -I${INTEL_DIR}/mkl/2022.1.0/include \
                -I${INTEL_DIR}/vtune/2022.2.0/include \
                -I/usr/lib/x86_64-linux-gnu
DEST          = ./
LDFLAGS       = -L${INTEL_DIR}/compiler/2022.1.2/linux/compiler/lib/intel64 \
                -L${INTEL_DIR}/mkl/2022.1.0/lib/intel64 \
                -L${INTEL_DIR}/mpi/2021.6.0/libfabric/lib
LIBS          = -L${INTEL_DIR}/mkl/lib/intel64 -lmkl_intel_ilp64 -lmkl_intel_thread -lmkl_core -lmkl_blacs_intelmpi_ilp64 -liomp5 -lpthread -lm -ldl
OBJS          = AnalysisControl.o \
                ComplexSparseMatrix.o \
                ComplexSparseSquareMatrix.o \
                ComplexSparseSquareSymmetricMatrix.o \
                ComplexSparseSquareUnsymmetricMatrix.o \
                DoubleSparseMatrix.o \
                DoubleSparseSquareMatrix.o \
                DoubleSparseSquareSymmetricMatrix.o \
                DoubleSparseSquareUnsymmetricMatrix.o \
                Forward2D.o \
                Forward2DQuadrilateralElement.o \
                Forward2DNonConformingQuadrilateralElement0thOrderEdgeBased.o \
                Forward2DQuadrilateralElementEdgeBased.o \
                Forward2DSquareElement.o \
                Forward2DSquareElement0thOrderEdgeBased.o \
                Forward2DSquareElement1stOrderEdgeBased.o \
                Forward2DSquareElement1stOrderNodeBased.o \
                Forward2DSquareElement2ndOrderNodeBased.o \
                Forward2DSquareElementEdgeBased.o \
                Forward2DSquareElementNodeBased.o \
                Forward2DTriangleElement.o \
                Forward2DTriangleElement0thOrderEdgeBased.o \
                Forward2DTriangleElement1stOrderNodeBased.o \
                Forward2DTriangleElementEdgeBased.o \
                Forward2DTriangleElementNodeBased.o \
                Forward3D.o \
                Forward3DBrickElement0thOrder.o \
                Forward3DNonConformingHexaElement0thOrder.o \
                Forward3DTetraElement0thOrder.o \
                Inversion.o \
                InversionGaussNewtonModelSpace.o \
                InversionGaussNewtonDataSpace.o \
                main.o \
                MeshData.o \
                MeshDataBrickElement.o \
                MeshDataNonConformingHexaElement.o \
                MeshDataTetraElement.o \
                AdditinalOutputPoint.o \
                ObservedDataStation.o \
                ObservedDataStationPoint.o \
                ObservedDataStationMT.o \
                ObservedDataStationApparentResistivityAndPhase.o \
                ObservedDataStationHTF.o \
                ObservedDataStationVTF.o \
                ObservedDataStationPT.o \
                ObservedDataStationNMT.o \
                ObservedDataStationNMT2.o \
                ObservedDataStationNMT2ApparentResistivityAndPhase.o \
                ObservedData.o \
                OutputFiles.o \
                PARDISOSolver.o \
                PARDISOSolverComplex.o \
                PARDISOSolverDouble.o \
                ResistivityBlock.o \
                RougheningMatrix.o \
                RougheningSquareMatrix.o \
                Util.o
PROGRAM       = femtic

all:            $(PROGRAM)

$(PROGRAM):     $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) $(LDFLAGS) $(LIBS) -o $(PROGRAM)

clean:;		rm -f *.o *~ $(PROGRAM) *.optrpt
