cmake_minimum_required(VERSION 3.10)
project(fortranTest LANGUAGES Fortran CSharp CXX)  

enable_language(Fortran)
set(CMAKE_Fortran_COMPILER "C:/Program Files (x86)/Intel/oneAPI/compiler/2025.0/bin/ifx.exe")
set(FVERSION "-std=f95")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${FVERSION}")

#
enable_language(CSharp)
SET(CMAKE_DOTNET_TARGET_FRAMEWORK_VERSION "v4.7.2")
SET(CMAKE_CSharp_FLAGS "/langversion:6")

IF(CMAKE_GENERATOR_PLATFORM STREQUAL "x64")
  SET(CMAKE_CSharp_FLAGS "${CMAKE_CSharp_FLAGS} /platform:x64")
ELSEIF(CMAKE_GENERATOR_PLATFORM STREQUAL "Win32")
  SET(CMAKE_CSharp_FLAGS "${CMAKE_CSharp_FLAGS} /platform:x86")
ELSE()
  MESSAGE(WARNING "Generator platform is set to '${CMAKE_GENERATOR_PLATFORM}', which is not supported by managed projects. Defaulting to 'AnyCPU'...")
  SET(CMAKE_CSharp_FLAGS "${CMAKE_CSharp_FLAGS} /platform:AnyCPU")
ENDIF()

#Set the C++ standard for all projects.
SET(CMAKE_CXX_STANDARD 17)

# Define runtime intermediate build directory, so that debugging the Visual Studio solution works as expected.
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/binaries/")





add_subdirectory(src)
add_executable(hello main.f90)