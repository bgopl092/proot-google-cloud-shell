# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM jupyter/scipy-notebook:latest
RUN echo 'root:root' | chpasswd
RUN apt update \
    && apt install --no-install-recommends -y rsyslog systemd dbus-user-session systemd-cron dbus sudo wget curl nano software-properties-common net-tools 
VOLUME ["/sys/fs/cgroup"]
ENTRYPOINT ["/sbin/init"]
