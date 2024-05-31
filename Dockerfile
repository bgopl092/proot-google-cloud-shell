# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM ubuntu:latest
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'root:root' | chpasswd
RUN apt update \
    && apt install -y python3 python3-pip python3-full sudo wget curl nano
RUN pip3 install notebook jupyterlab
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
RUN echo "ubuntu ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
