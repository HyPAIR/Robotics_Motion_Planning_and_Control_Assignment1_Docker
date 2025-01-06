## Installation

First, please ensure that your system meets the basic requirements to build and run the simulation:

- Ubuntu 20.04 LTS
- ROS2 Foxy

### Docker

Check out the docker directory if you want to build this project without installing all the dependencies on your system.

```
$ mkdir -p ~/colcon_ws/src
$ cd ~/colcon_ws/src
$ git clone https://github.com/HyPAIR/panda_ros2_gazebo.git
$ cd panda_ros2_gazebo/docker
$ docker build -t panda_ros2_gazebo .
$ cd ~/colcon_ws/
$ sudo ./src/panda_ros2_gazebo/docker/run.bash panda_ros2_gazebo build
$ sudo ./src/panda_ros2_gazebo/docker/run.bash panda_ros2_gazebo <demo>
```

Set the `<demo>` argument as `fk` for launching the forward kinematics node, or `ik` for the inverse kinematics. Check out the `entrypoint.bash` to see how the demos are launched. 

** At the moment, the `gzclient` hangs when launching the simulation from `run.bash`. Gazebo splash screen appears and then hangs and never finishes launching.** 
