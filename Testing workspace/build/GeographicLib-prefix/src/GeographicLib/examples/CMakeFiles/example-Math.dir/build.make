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
CMAKE_SOURCE_DIR = "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib"

# Include any dependencies generated for this target.
include examples/CMakeFiles/example-Math.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/example-Math.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/example-Math.dir/flags.make

examples/CMakeFiles/example-Math.dir/example-Math.cpp.o: examples/CMakeFiles/example-Math.dir/flags.make
examples/CMakeFiles/example-Math.dir/example-Math.cpp.o: examples/example-Math.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/example-Math.dir/example-Math.cpp.o"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-Math.dir/example-Math.cpp.o -c "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Math.cpp"

examples/CMakeFiles/example-Math.dir/example-Math.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-Math.dir/example-Math.cpp.i"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Math.cpp" > CMakeFiles/example-Math.dir/example-Math.cpp.i

examples/CMakeFiles/example-Math.dir/example-Math.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-Math.dir/example-Math.cpp.s"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Math.cpp" -o CMakeFiles/example-Math.dir/example-Math.cpp.s

# Object files for target example-Math
example__Math_OBJECTS = \
"CMakeFiles/example-Math.dir/example-Math.cpp.o"

# External object files for target example-Math
example__Math_EXTERNAL_OBJECTS =

examples/example-Math: examples/CMakeFiles/example-Math.dir/example-Math.cpp.o
examples/example-Math: examples/CMakeFiles/example-Math.dir/build.make
examples/example-Math: src/libGeographic.so.14.0.1
examples/example-Math: examples/CMakeFiles/example-Math.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example-Math"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-Math.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/example-Math.dir/build: examples/example-Math

.PHONY : examples/CMakeFiles/example-Math.dir/build

examples/CMakeFiles/example-Math.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -P CMakeFiles/example-Math.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/example-Math.dir/clean

examples/CMakeFiles/example-Math.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/CMakeFiles/example-Math.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : examples/CMakeFiles/example-Math.dir/depend

