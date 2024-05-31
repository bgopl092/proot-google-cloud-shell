# Dockerfile: JupyterLab container image that has root permissions

# Start from a base Jupyter image
FROM python:3.9-slim
RUN pip install --no-cache notebook jupyterlab
ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'root:root' | chpasswd
