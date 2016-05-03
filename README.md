# docker_centos7_gr

A collection of docker image layers for building (eventually) GNU Radio via PyBOMBS on top of a CentOS 7 base layer.  Currently configured to build through apache-thrift

## To Build 

After installing and configuring the Docker daemon on your host machine, first download the CentOS 7 base image.  This step will save you time in subsequent re-builds:

    $ [sudo] docker pull centos:7.2.1511

Next, build the c6conda image layer, which installs the Anaconda2 python distribution on top of the CentOS 6 base layer:

    $ [sudo] ./build-c7gr-docker.sh

Success!

## Debugging
If the bulid of either layer fails at any point, you can use the associated "debug" shell script to open up a shell inside of your incomplete layer to probe why the build may have failed

