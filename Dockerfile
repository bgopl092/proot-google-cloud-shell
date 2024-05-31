# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM ubuntu:latest
USER root
RUN echo 'root:root' | chpasswd
