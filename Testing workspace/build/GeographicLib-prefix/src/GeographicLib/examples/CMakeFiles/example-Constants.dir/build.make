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
include examples/CMakeFiles/example-Constants.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/example-Constants.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/example-Constants.dir/flags.make

examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.o: examples/CMakeFiles/example-Constants.dir/flags.make
examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.o: examples/example-Constants.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.o"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-Constants.dir/example-Constants.cpp.o -c "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Constants.cpp"

examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-Constants.dir/example-Constants.cpp.i"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Constants.cpp" > CMakeFiles/example-Constants.dir/example-Constants.cpp.i

examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-Constants.dir/example-Constants.cpp.s"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-Constants.cpp" -o CMakeFiles/example-Constants.dir/example-Constants.cpp.s

# Object files for target example-Constants
example__Constants_OBJECTS = \
"CMakeFiles/example-Constants.dir/example-Constants.cpp.o"

# External object files for target example-Constants
example__Constants_EXTERNAL_OBJECTS =

examples/example-Constants: examples/CMakeFiles/example-Constants.dir/example-Constants.cpp.o
examples/example-Constants: examples/CMakeFiles/example-Constants.dir/build.make
examples/example-Constants: src/libGeographic.so.14.0.1
examples/example-Constants: examples/CMakeFiles/example-Constants.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example-Constants"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-Constants.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/example-Constants.dir/build: examples/example-Constants

.PHONY : examples/CMakeFiles/example-Constants.dir/build

examples/CMakeFiles/example-Constants.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -P CMakeFiles/example-Constants.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/example-Constants.dir/clean

examples/CMakeFiles/example-Constants.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/CMakeFiles/example-Constants.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : examples/CMakeFiles/example-Constants.dir/depend
