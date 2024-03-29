#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install ros-kinetic-ros-base

sudo rosdep init

rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt-get install python-rosinstall

# additional packages
sudo apt-get install    ros-kinetic-yocs-velocity-smoother \
                        ros-kinetic-xacro \
                        ros-kinetic-robot-pose-publisher \
                        ros-kinetic-joint-state-publisher \
                        ros-kinetic-amcl \
                        ros-kinetic-robot-state-publisher \
                        ros-kinetic-teleop-twist-keyboard \
                        ros-kinetic-navigation
