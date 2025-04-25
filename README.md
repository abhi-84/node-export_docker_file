Use Dockerfile to create node-exporter v1.9.0 riscv docker image
# docker build -t nodeexporter_docker_image:v1.9.0 .
Save docker image to local disk in tar format
# docker save -o nodeexporter_image.tar nodeexporter_docker_image:v1.9.0
