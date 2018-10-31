set(EXAMPLE_PROJECT_NAME volumetric_mesh_deformation)

set(${EXAMPLE_PROJECT_NAME}_SOURCES
    src/CeresSolver.cpp
    src/CUDAWarpingSolver.cpp
    src/main.cpp
    src/mLibSource.cpp
    )

set(${EXAMPLE_PROJECT_NAME}_CUDA_SOURCES
    src/WarpingSolver.cu
    )

set(${EXAMPLE_PROJECT_NAME}_HEADERS
    src/CeresSolver.h
    src/CombinedSolver.h
    src/CUDATimer.h
    src/CUDAWarpingSolver.h
    src/mLibInclude.h
    src/OpenMesh.h
    src/RotationHelper.h
    src/SolverUtil.h
    src/WarpingSolverEquations.h
    src/WarpingSolverParameters.h
    src/WarpingSolverState.h
    src/WarpingSolverUtil.h
    )

set(${EXAMPLE_PROJECT_NAME}_COMMON_HEADERS
    ../shared/CombinedSolverBase.h
    ../shared/CombinedSolverParameters.h
    ../shared/cuda_SimpleMatrixUtil.h
    ../shared/cudaUtil.h
    )


cuda_add_executable(${EXAMPLE_PROJECT_NAME}
        ${${EXAMPLE_PROJECT_NAME}_SOURCES}
        ${${EXAMPLE_PROJECT_NAME}_CUDA_SOURCES}
        ${${EXAMPLE_PROJECT_NAME}_HEADERS}
        ${${EXAMPLE_PROJECT_NAME}_COMMON_HEADERS})

set_property(TARGET ${EXAMPLE_PROJECT_NAME} PROPERTY CUDA_STANDARD 11)

target_include_directories(${EXAMPLE_PROJECT_NAME} PUBLIC src ${CMAKE_CURRENT_SOURCE_DIR} ../shared/ )
target_include_directories(${EXAMPLE_PROJECT_NAME} PUBLIC ${OPENMESH_INCLUDE_DIR})

#find_library(OpenMesh_CORE_LIBRARY libOpenMeshCore.a ../external/OpenMesh/lib/linux)
#find_library(OpenMesh_TOOLS_LIBRARY libOpenMeshTools.a ../external/OpenMesh/lib/linux)
#set(OPENMESH_LIBRARIES ${OpenMesh_CORE_LIBRARY} ${OpenMesh_TOOLS_LIBRARY})
find_package(OpenMesh REQUIRED)


target_link_libraries(${EXAMPLE_PROJECT_NAME}
                        ${Opt_LIBRARIES} ml ${OPENMESH_LIBRARIES} ${Terra_LIBRARY})
