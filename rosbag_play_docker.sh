#!/bin/bash
docker run \
       --net host \
       -it --rm \
       -v $(realpath .):/bags \
       -w /bags \
       ros:noetic \
       rosbag play $@
