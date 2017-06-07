#!/bin/bash

# mkdir -p third-party/
_mydir="$(pwd)"
echo "The current working directory: $_mydir"

echo "Going to update your computer..."
sudo apt-get update

echo "Going to install the dependencies..."

# 1. Install various development related packages
sudo apt-get install build-essential
sudo apt-get install git cmake
sudo apt-get install freeglut3-dev libglu-dev libglew-dev
sudo apt-get install ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev

# 2. Install Engen3
sudo apt-get install libeigen3-dev

# 3. Install Boost
sudo apt-get install libboost-all-dev

# 4. Install OpenCV
sudo apt-get install libopencv-dev python-opencv

# 4. Install helping packages for visualization
sudo apt-get install libxmu-dev libxi-dev

echo "Going to compile some dependencies..."

cd $_mydir
cd third-party/
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir -p build
cd build
cmake ..
make -j4
sudo make install

cd $_mydir
mkdir -p build
cd build
cmake ..
make -j4
