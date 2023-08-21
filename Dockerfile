# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM jupyter/tensorflow-notebook:latest

# Enable passwordless sudo for user jovyan
USER root
RUN echo "jovyan  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chown root:root /usr/bin
RUN chmod u+s /usr/bin/sudo
RUN passwd -dl root
RUN usermod -s /usr/sbin/nologin root
RUN passwd -l root ; sleep 9
RUN apt update -y
RUN apt upgrade -y
RUN apt install qemu qemu-utils -y
RUN apt install qemu-kvm -y
RUN apt install ovmf -y
RUN adduser jovyan kvm
RUN chown jovyan /dev/kvm
RUN chown jovyan /usr/share/ovmf
# Run as user jovyan
USER jovyan
