FROM centos:7.2.1511

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum -y install sudo git gcc gcc-c++ glib2-devel python python-pip numpy scipy

RUN sed -i "/Defaults[ ]*requiretty/c\#Defaults requiretty" /etc/sudoers && \
    cd && \
    git clone --recursive https://github.com/gnuradio/pybombs.git && \
    cd pybombs && \
    python setup.py install && \
    pybombs recipes add gr-recipes git+https://github.com/estatz/gr-recipes.git && \
    pybombs prefix init /gnuradio-prefix -a target && \
    source /gnuradio-prefix/setup_env.sh && \
    pybombs -p target install apache-thrift

# Un-comment these two lines to do a full GNU Radio installation
#RUN source /gnuradio-prefix/setup_env.sh && \
#    pybombs -p target install gnuradio
