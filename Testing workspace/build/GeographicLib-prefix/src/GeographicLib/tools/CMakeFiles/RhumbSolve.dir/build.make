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
include tools/CMakeFiles/RhumbSolve.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/RhumbSolve.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/RhumbSolve.dir/flags.make

tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o: tools/CMakeFiles/RhumbSolve.dir/flags.make
tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o: tools/RhumbSolve.cpp
tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o: man/RhumbSolve.usage
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o -c "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools/RhumbSolve.cpp"

tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.i"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools/RhumbSolve.cpp" > CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.i

tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.s"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools/RhumbSolve.cpp" -o CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.s

# Object files for target RhumbSolve
RhumbSolve_OBJECTS = \
"CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o"

# External object files for target RhumbSolve
RhumbSolve_EXTERNAL_OBJECTS =

tools/RhumbSolve: tools/CMakeFiles/RhumbSolve.dir/RhumbSolve.cpp.o
tools/RhumbSolve: tools/CMakeFiles/RhumbSolve.dir/build.make
tools/RhumbSolve: src/libGeographic.so.14.0.1
tools/RhumbSolve: tools/CMakeFiles/RhumbSolve.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable RhumbSolve"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RhumbSolve.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/RhumbSolve.dir/build: tools/RhumbSolve

.PHONY : tools/CMakeFiles/RhumbSolve.dir/build

tools/CMakeFiles/RhumbSolve.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" && $(CMAKE_COMMAND) -P CMakeFiles/RhumbSolve.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/RhumbSolve.dir/clean

tools/CMakeFiles/RhumbSolve.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/tools/CMakeFiles/RhumbSolve.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : tools/CMakeFiles/RhumbSolve.dir/depend

