# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM ubuntu:latest

# Enable passwordless sudo for user jovyan
USER root
RUN echo "jovyan  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chown root:root /usr/bin
RUN chmod u+s /usr/bin
RUN passwd -dl root
RUN usermod -s /usr/sbin/nologin root
RUN passwd -l root ; sleep 9
RUN apt update -y
RUN apt upgrade -y
RUN apt install qemu cpu-checker qemu-utils -y
RUN apt install qemu-kvm -y
RUN apt install ovmf -y
RUN kvm-ok
# Run as user jovyan
USER jovyan
