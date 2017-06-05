#!/bin/bash

mkdir -p ~/scenelib/
mkdir -p ~/scenelib/third-party/

echo "SceneLib is going to be installed on: "
echo ~/scenelib/

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
# sudo apt-get install libopencv-dev python-opencv

echo "Going to compile some dependencies..."

cd ~/scenelib/third-party/
wget https://github.com/opencv/opencv/archive/2.4.13.zip
tar xvf opencv-2.4.13.zip
cd opencv-2.4.13
mkdir build
cd build
cmake ..
make -j4
sudo make install


cd ~/scenelib/third-party/
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
make -j4
sudo make install


cd ~/scenelib/
git clone git://github.com/OpenMapper/SceneLib2.git SceneLib2
cd SceneLib2
mkdir build
cd build
cmake ..
make -j4
