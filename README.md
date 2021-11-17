# CMake Excess Rebuild

CMake sometimes rebuilds unnecessarily, particularly in Fortran projects using Ninja generator and Intel compilers, as noted in [CMake issue](https://gitlab.kitware.com/cmake/cmake/-/issues/22922).

In the example below, the issue is specific to Intel compiler + Ninja.
It does NOT occur with GNU Make (Unix Makefiles/MinGW Makefiles) or GCC (regardless of generator).

## Example

The computers had environment variable CMAKE_GENERATOR=Ninja.
Essentially same results for Windows, MacOS and Linux

* GCC 11.2.0
* Intel oneAPI 2021.4
* Ninja 1.10.2
* CMake 3.21.4

The rebuild.cmake script "touches" mod.f90, which would be expected to rebuild only: mod.f90, main.f90. GCC + Make/Ninja is OK.
Intel compiler + Ninja rebuilds excessively--smod.f90 and smod2.f90 are unnecessarily rebuilt.
On a large project, this causes Intel + Ninja to be significantly slower at rebuild.

## GCC compiler

```sh
cmake -P rebuild.cmake
```

after the first time:

```
[1/4] Building Fortran preprocessed CMakeFiles/main.dir/smod.f90-pp.f90
[2/4] Generating Fortran dyndep file CMakeFiles/main.dir/Fortran.dd
[3/4] Building Fortran object CMakeFiles/main.dir/smod.f90.obj
[4/4] Linking Fortran executable main.exe
```

## Intel compiler

```sh
cmake -P rebuild.cmake
```

after the first time:

```
[1/4] Building Fortran preprocessed CMakeFiles\main.dir\mod.f90-pp.f90
[2/4] Generating Fortran dyndep file CMakeFiles\main.dir\Fortran.dd
[3/7] Building Fortran object CMakeFiles\main.dir\mod.f90.obj
[4/7] Building Fortran object CMakeFiles\main.dir\smod.f90.obj
[5/7] Building Fortran object CMakeFiles\main.dir\smod2.f90.obj
[6/7] Building Fortran object CMakeFiles\main.dir\main.f90.obj
[7/7] Linking Fortran executable main.exe
```

NOTE: This excess rebuild only happens with Ninja.
It does not occur with GNU Make.
