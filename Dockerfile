#########################################################################
#                             Build Layer
#########################################################################

FROM ubuntu:18.04

## Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing
RUN apt-get install dialog apt-utils -y
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y -q wget \
	bzip2 \
	ca-certificates \
	build-essential \
	curl \
	git-core \
	pkg-config \
	python3-dev \
	python3-pip \
	python3-setuptools \
	python3-virtualenv \
	unzip \
  vim \
	software-properties-common \
	llvm \
  python3-rtree

RUN apt install -y gdal-bin python-gdal python3-gdal

## Install packages to Python3
RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy pandas geopandas
RUN pip3 install geopandas
RUN pip3 install contextily
RUN pip3 install mapclassify
RUN pip3 install descartes
RUN pip3 install notebook
RUN ["apt-get", "install", "-y", "python3-matplotlib"]

## Setup File System
RUN mkdir app
ENV HOME=/app
ENV SHELL=/bin/bash
VOLUME /app
WORKDIR /app
