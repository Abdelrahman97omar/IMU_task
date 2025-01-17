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

# Utility rule file for manpages.

# Include the progress variables for this target.
include man/CMakeFiles/manpages.dir/progress.make

man/CMakeFiles/manpages: man/CartConvert.1
man/CMakeFiles/manpages: man/ConicProj.1
man/CMakeFiles/manpages: man/GeodesicProj.1
man/CMakeFiles/manpages: man/GeoConvert.1
man/CMakeFiles/manpages: man/GeodSolve.1
man/CMakeFiles/manpages: man/GeoidEval.1
man/CMakeFiles/manpages: man/Gravity.1
man/CMakeFiles/manpages: man/MagneticField.1
man/CMakeFiles/manpages: man/Planimeter.1
man/CMakeFiles/manpages: man/RhumbSolve.1
man/CMakeFiles/manpages: man/TransverseMercatorProj.1
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building all the man pages"

man/CartConvert.1: man/CartConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building man page for CartConvert"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/CartConvert.pod > CartConvert.1

man/ConicProj.1: man/ConicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building man page for ConicProj"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/ConicProj.pod > ConicProj.1

man/GeodesicProj.1: man/GeodesicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building man page for GeodesicProj"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/GeodesicProj.pod > GeodesicProj.1

man/GeoConvert.1: man/GeoConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building man page for GeoConvert"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/GeoConvert.pod > GeoConvert.1

man/GeodSolve.1: man/GeodSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building man page for GeodSolve"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/GeodSolve.pod > GeodSolve.1

man/GeoidEval.1: man/GeoidEval.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building man page for GeoidEval"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/GeoidEval.pod > GeoidEval.1

man/Gravity.1: man/Gravity.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building man page for Gravity"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/Gravity.pod > Gravity.1

man/MagneticField.1: man/MagneticField.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building man page for MagneticField"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/MagneticField.pod > MagneticField.1

man/Planimeter.1: man/Planimeter.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Building man page for Planimeter"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/Planimeter.pod > Planimeter.1

man/RhumbSolve.1: man/RhumbSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_11) "Building man page for RhumbSolve"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/RhumbSolve.pod > RhumbSolve.1

man/TransverseMercatorProj.1: man/TransverseMercatorProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_12) "Building man page for TransverseMercatorProj"
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && pod2man --center="GeographicLib Utilities" --release="GeographicLib 1.40" /home/abdelrahman/Arduino/imu\ task/Testing\ workspace/build/GeographicLib-prefix/src/GeographicLib/man/TransverseMercatorProj.pod > TransverseMercatorProj.1

manpages: man/CMakeFiles/manpages
manpages: man/CartConvert.1
manpages: man/ConicProj.1
manpages: man/GeodesicProj.1
manpages: man/GeoConvert.1
manpages: man/GeodSolve.1
manpages: man/GeoidEval.1
manpages: man/Gravity.1
manpages: man/MagneticField.1
manpages: man/Planimeter.1
manpages: man/RhumbSolve.1
manpages: man/TransverseMercatorProj.1
manpages: man/CMakeFiles/manpages.dir/build.make

.PHONY : manpages

# Rule to build all files generated by this target.
man/CMakeFiles/manpages.dir/build: manpages

.PHONY : man/CMakeFiles/manpages.dir/build

man/CMakeFiles/manpages.dir/clean:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" && $(CMAKE_COMMAND) -P CMakeFiles/manpages.dir/cmake_clean.cmake
.PHONY : man/CMakeFiles/manpages.dir/clean

man/CMakeFiles/manpages.dir/depend:
	cd "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man" "/home/abdelrahman/Arduino/imu task/Testing workspace/build/GeographicLib-prefix/src/GeographicLib/man/CMakeFiles/manpages.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : man/CMakeFiles/manpages.dir/depend

