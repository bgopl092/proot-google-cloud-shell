# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM jupyter/datascience-notebook:latest
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'root:root' | chpasswd
RUN echo "ubuntu ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

