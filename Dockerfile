# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM jupyter/scipy-notebook:latest

# Enable passwordless sudo for user jovyan
USER root
RUN echo "jovyan  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chown root:root /usr/bin
RUN chmod u+s /usr/bin/sudo
RUN passwd -dl root

# Run as user jovyan
USER jovyan
