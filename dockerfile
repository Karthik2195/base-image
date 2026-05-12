# Use the latest LTS version
FROM ubuntu:24.04

# Set environment variables to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install common base utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    vim \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# (Optional) Create a non-root user for security
RUN useradd -m -s /bin/bash ubuntu-user
USER ubuntu-user
WORKDIR /home/ubuntu-user

# Set the default command
CMD ["/bin/bash"]
