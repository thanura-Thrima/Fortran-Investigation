
SET_TARGET_PROPERTIES(${EXECUTABLE_NAME} PROPERTIES
                      COMPILE_FLAGS "${OpenMP_Fortran_FLAGS}"
                      LINK_FLAGS "${OpenMP_Fortran_FLAGS}")

set(Geometry   maths.f90
               sorts.f90
               geometry.f90
              CACHE INTERNAL "")
add_library(Geomlib SHARED "${Geometry}")