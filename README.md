# ros1_docker_scripts

This package provides a set of shell scripts to do ROS1 operation via docker. The first call of each script may take a minute to download and build docker images.

## Install

Add the path to ```ros1_docker_scripts``` to the environment variable.
```bash
echo 'export PATH=$PATH:~/libs/ros1_docker_scripts' >> ~/.bashrc
source ~/.bashrc
```

## General ROS1 commands

```bash
$ ros1_docker.sh roscore
$ ros1_docker.sh rostopic list
```

## roscore

```bash
$ roscore_docker.sh 

... logging to /root/.ros/log/69d30f14-a295-11ed-9cf8-a8a159534b31/roslaunch-case-1.log
Checking log directory for disk usage. This may take a while.
Press Ctrl-C to interrupt
Done checking log file disk usage. Usage is <1GB.

started roslaunch server http://case:33891/
ros_comm version 1.15.15


SUMMARY
========

PARAMETERS
 * /rosdistro: noetic
 * /rosversion: 1.15.15

NODES

auto-starting new master
process[master]: started with pid [32]
ROS_MASTER_URI=http://case:11311/

setting /run_id to 69d30f14-a295-11ed-9cf8-a8a159534b31
process[rosout-1]: started with pid [42]
started core service [/rosout]
```

## rosbag

## info

```bash
$ rosbag_info_docker.sh livox.bag 

path:        /tmp/bag.bag
version:     2.0
duration:    1:01s (61s)
start:       Jun 23 2022 09:47:20.75 (1655977640.75)
end:         Jun 23 2022 09:48:22.55 (1655977702.55)
size:        584.9 MB
messages:    13847
compression: none [618/618 chunks]
types:       livox_ros_driver/CustomMsg [e4d6829bdfe657cb6c21a746c86b21a6]
             sensor_msgs/Imu            [6a62c6daae103f4ff57a132d6f95cec2]
             sensor_msgs/PointCloud2    [1158d486dd51d683ce2f1be655c3c181]
topics:      /livox/imu      12611 msgs    : sensor_msgs/Imu           
             /livox/lidar      618 msgs    : livox_ros_driver/CustomMsg
             /livox/points     618 msgs    : sensor_msgs/PointCloud2
```

## play

```bash
# Bag file must exist in the current working directory
$ rosbag_play_docker.sh livox.bag 

[ INFO] [1675299905.453477347]: Opening livox.bag

Waiting 0.2 seconds after advertising topics... done.

Hit space to toggle paused, or 's' to step.
 [RUNNING]  Bag Time: 1655977641.353435   Duration: 0.598922 / 61.796589  
```

## echo

```bash
$ rostopic_echo_docker.sh --noarr /livox/points

---
header: 
  seq: 762
  stamp: 
    secs: 114
    nsecs:  99811180
  frame_id: "livox_frame"
height: 1
width: 24000
fields: "<array type: sensor_msgs/PointField, length: 7>"
is_bigendian: False
point_step: 22
row_step: 528000
data: "<array type: uint8, length: 528000>"
is_dense: True
```

## rostopic

## list

```bash
$ rostopic_list_docker.sh

/rosout
/rosout_agg
```


## rviz

```bash
# Open an empty rviz1
$ rviz_docker.sh
```

```bash
# Open rviz1 with a config file
$ rviz_docker.sh back.rviz
```
