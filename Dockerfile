# Use Ubuntu as the base image
FROM riscv64/ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget tar gzip ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



# Set environment variables
ENV NODEEXPORTER_VERSION=1.9.0

# Download and extract Node exporter
RUN wget https://github.com/prometheus/node_exporter/releases/download/v${NODEEXPORTER_VERSION}/node_exporter-${NODEEXPORTER_VERSION}.linux-riscv64.tar.gz \
    && tar -xzf node_exporter-${NODEEXPORTER_VERSION}.linux-riscv64.tar.gz \
    && mv node_exporter-${NODEEXPORTER_VERSION}.linux-riscv64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-${NODEEXPORTER_VERSION}.linux-riscv64.tar.gz node_exporter-${NODEEXPORTER__VERSION}.linux-riscv64


# Expose port 9100 for Node exporter
EXPOSE 9100

# Set entrypoint to run node exporter
ENTRYPOINT ["/usr/local/bin/node_exporter"]
