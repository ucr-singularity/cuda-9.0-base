FROM nvidia/cuda:9.0-cudnn7-devel
FROM nvidia/cuda:9.0-cudnn7-devel
RUN # Update list of available packages, then upgrade them
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN # Workaround for https://github.com/keras-team/keras/issues/9567, now deprecated.
RUN #apt-get install -y --allow-downgrades --no-install-recommends \
libcudnn7=7.0.5.15-1+cuda9.0 libcudnn7-dev=7.0.5.15-1+cuda9.0
RUN # Utility and support packages
RUN apt-get install -y screen terminator tmux vim wget
RUN apt-get install -y aptitude build-essential cmake g++ gfortran git \
pkg-config python-pip python-dev software-properties-common
RUN apt-get install -y unrar
RUN # Add PPA for ffmpeg
RUN add-apt-repository -y ppa:jonathonf/ffmpeg-3
RUN apt-get update
RUN apt-get install -y ffmpeg
RUN # More utilities
RUN apt-get install -y graphviz libatlas-dev libfreetype6 libfreetype6-dev \
libgraphviz-dev liblapack-dev swig libxft-dev libxml2-dev \
libxslt-dev zlib1g-dev
RUN # Python modules from system package manager
RUN apt-get install -y python-numpy python-scipy python-nose python-h5py \
python-skimage python-matplotlib python-pandas python-sklearn \
python-sympy python-virtualenv
RUN # More dependencies/useful software from system package manager
RUN apt-get install -v libopenblas-dev libfreetype7-dev libpng12-dev \
libglib2.0-0 libsm6 libxext6 libxrender1
RUN # Caffe dependencies
RUN apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev \
libhdf5-serial-dev protobuf-compiler
RUN apt-get install --no-install-recommends -y libboost-all-dev
RUN apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
RUN # Theano dependencies not already installed
RUN apt-get install -y python-pygments python-sphinx
RUN # Dense Flow dependencies
RUN apt-get install -y libzip-dev
RUN # OpenCV build dependencies not already installed
RUN apt-get install -y checkinstall yasm libjpeg-dev libjpeg8-dev \
libjasper-dev libavcodec-dev libavformat-dev libswscale-dev \
libdc1394-22-dev libgstreamer0.10-dev \
libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy \
libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev \
libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev \
libxvidcore-dev x264 v4l-utils libgtk-3-dev
RUN # PIL (actually Pillow)
RUN pip install --no-cache-dir Pillow
RUN # Jupyter and jupyterlab
RUN pip install --no-cache-dir jupyter
RUN pip install --no-cache-dir jupyterlab
RUN # Various useful Python packages
RUN pip install --no-cache-dir pygraphviz
RUN pip install --no-cache-dir networkx
RUN pip install --no-cache-dir numexpr
RUN pip install --no-cache-dir pymc
RUN pip install --no-cache-dir patsy
RUN pip install --no-cache-dir Cython
RUN pip install --no-cache-dir statsmodels
RUN pip install --no-cache-dir restview
RUN pip install --no-cache-dir tinkerer
RUN pip install --no-cache-dir Pweave
RUN pip install --no-cache-dir numba
RUN # Gnuplot
RUN apt-get install -y gnuplot-x11
RUN # Clean up
RUN apt-get -y autoremove
RUN rm -rvf /var/lib/apt/lists/*
CMD exec /bin/bash "$@"
