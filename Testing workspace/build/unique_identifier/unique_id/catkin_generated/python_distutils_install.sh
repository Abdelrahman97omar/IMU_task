#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/abdelrahman/Arduino/imu task/Testing workspace/src/unique_identifier/unique_id"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/abdelrahman/Arduino/imu task/Testing workspace/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/abdelrahman/Arduino/imu task/Testing workspace/install/lib/python3/dist-packages:/home/abdelrahman/Arduino/imu task/Testing workspace/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/abdelrahman/Arduino/imu task/Testing workspace/build" \
    "/usr/bin/python3" \
    "/home/abdelrahman/Arduino/imu task/Testing workspace/src/unique_identifier/unique_id/setup.py" \
    egg_info --egg-base /home/abdelrahman/Arduino/imu task/Testing workspace/build/unique_identifier/unique_id \
    build --build-base "/home/abdelrahman/Arduino/imu task/Testing workspace/build/unique_identifier/unique_id" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/abdelrahman/Arduino/imu task/Testing workspace/install" --install-scripts="/home/abdelrahman/Arduino/imu task/Testing workspace/install/bin"
