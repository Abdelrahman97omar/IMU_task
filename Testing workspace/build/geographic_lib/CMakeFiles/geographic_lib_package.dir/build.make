# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/abdelrahman/Arduino/imu task/Testing workspace/src"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/abdelrahman/Arduino/imu task/Testing workspace/build"

# Utility rule file for geographic_lib_package.

# Include the progress variables for this target.
include geographic_lib/CMakeFiles/geographic_lib_package.dir/progress.make

geographic_lib_package: geographic_lib/CMakeFiles/geographic_lib_package.dir/build.make

.PHONY : geographic_lib_package

# Rule to build all files generated by this target.
geographic_lib/CMakeFiles/geographic_lib_package.dir/build: geographic_lib_package

.PHONY : geographic_lib/CMakeFiles/geographic_lib_package.dir/build

geographic_lib/CMakeFiles/geographic_lib_package.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/geographic_lib" && $(CMAKE_COMMAND) -P CMakeFiles/geographic_lib_package.dir/cmake_clean.cmake
.PHONY : geographic_lib/CMakeFiles/geographic_lib_package.dir/clean

geographic_lib/CMakeFiles/geographic_lib_package.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/src" "/home/abdelrahman/Arduino/imu task/Testing workspace/src/geographic_lib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/geographic_lib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/geographic_lib/CMakeFiles/geographic_lib_package.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : geographic_lib/CMakeFiles/geographic_lib_package.dir/depend

