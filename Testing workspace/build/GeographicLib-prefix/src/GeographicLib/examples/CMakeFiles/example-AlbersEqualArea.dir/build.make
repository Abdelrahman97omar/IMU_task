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
include examples/CMakeFiles/example-AlbersEqualArea.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/example-AlbersEqualArea.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/example-AlbersEqualArea.dir/flags.make

examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o: examples/CMakeFiles/example-AlbersEqualArea.dir/flags.make
examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o: examples/example-AlbersEqualArea.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o -c "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-AlbersEqualArea.cpp"

examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.i"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-AlbersEqualArea.cpp" > CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.i

examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.s"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/example-AlbersEqualArea.cpp" -o CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.s

# Object files for target example-AlbersEqualArea
example__AlbersEqualArea_OBJECTS = \
"CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o"

# External object files for target example-AlbersEqualArea
example__AlbersEqualArea_EXTERNAL_OBJECTS =

examples/example-AlbersEqualArea: examples/CMakeFiles/example-AlbersEqualArea.dir/example-AlbersEqualArea.cpp.o
examples/example-AlbersEqualArea: examples/CMakeFiles/example-AlbersEqualArea.dir/build.make
examples/example-AlbersEqualArea: src/libGeographic.so.14.0.1
examples/example-AlbersEqualArea: examples/CMakeFiles/example-AlbersEqualArea.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example-AlbersEqualArea"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-AlbersEqualArea.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/example-AlbersEqualArea.dir/build: examples/example-AlbersEqualArea

.PHONY : examples/CMakeFiles/example-AlbersEqualArea.dir/build

examples/CMakeFiles/example-AlbersEqualArea.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" && $(CMAKE_COMMAND) -P CMakeFiles/example-AlbersEqualArea.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/example-AlbersEqualArea.dir/clean

examples/CMakeFiles/example-AlbersEqualArea.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/examples/CMakeFiles/example-AlbersEqualArea.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : examples/CMakeFiles/example-AlbersEqualArea.dir/depend
