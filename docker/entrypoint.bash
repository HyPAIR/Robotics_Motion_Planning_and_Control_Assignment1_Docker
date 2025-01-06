#!/usr/bin/env bash
set -e

cd ${WORKSPACE_DIR}

source /opt/ros/${ROS2_DISTRO}/setup.bash

if [ "$1" = "build" ]; then

    MAKEFLAGS="-j1" colcon build --merge-install --parallel-workers 1 --cmake-args -DIDYNTREE_USES_PYTHON=True -DIDYNTREE_USES_IPOPT:BOOL=ON -DCMAKE_BUILD_TYPE=Release

else
    source install/setup.bash

    if [ "$1" = "fk" ]; then
        ros2 launch panda_ros2_gazebo gazebo.launch.py & cd src/assignment & python3 forward_kinematics.py & wait
    elif [ "$1" = "ik" ]; then
        ros2 launch panda_ros2_gazebo gazebo.launch.py & cd src/assignment & python3 inverse_kinematics.py & wait
    else
        echo "Unknown option: $1"
        echo "Usage: $0 [build|fk|ik]"
        exit 1
    fi
fi

