#!/bin/bash
docker run \
       --net host \
       -it --rm \
       ros:noetic \
       rostopic echo $@
