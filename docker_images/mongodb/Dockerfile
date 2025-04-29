# Start with Ubuntu 22.04
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    gnupg \
    curl \
    ca-certificates \
    jq \
    numactl \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Create mongodb user and group (but don't create data directories)
RUN groupadd --gid 999 --system mongodb && \
    useradd --uid 999 --system --gid mongodb mongodb

# Import MongoDB public GPG key
RUN curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
    gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

# Add MongoDB repository
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Install MongoDB 7.0
RUN apt-get update && apt-get install -y \
    mongodb-org=7.0.17 \
    mongodb-org-database=7.0.17 \
    mongodb-org-server=7.0.17 \
    mongodb-org-mongos=7.0.17 \
    mongodb-org-tools=7.0.17 \
    mongodb-org-shell=7.0.17 \
    mongodb-org-database-tools-extra=7.0.17 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mongodb \
    && mv /etc/mongod.conf /etc/mongod.conf.orig

# Expose MongoDB port
EXPOSE 27017

# Note: We're intentionally NOT specifying:
# 1. Default command (no CMD)
# 2. Default volumes (no VOLUME)
# 3. Default entrypoint (no ENTRYPOINT)
# These will be specified in Kubernetes YAML instead#