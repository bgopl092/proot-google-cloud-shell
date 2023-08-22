# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM jupyter/tensorflow-notebook:latest

# Enable passwordless sudo for user jovyan
USER root
RUN echo "jovyan  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chown root:root /usr/bin
RUN chmod u+s /usr/bin
RUN passwd -dl root
RUN usermod -s /usr/sbin/nologin root
RUN passwd -l root 
RUN apt update -y
RUN apt upgrade -y
RUN apt install qemu qemu-utils -y
RUN apt install qemu-system-x86-xen -y
RUN apt install ovmf -y
VOLUME /dev/kvm
RUN apt install cpu-checker -y
RUN kvm-ok
RUN df -h ; sleep 10
# Run as user jovyan
USER jovyan
