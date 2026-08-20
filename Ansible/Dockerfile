FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Common Developer Tools + OpenSSH Server
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    build-essential \
    curl \
    wget \
    git \
    vim \
    nano \
    unzip \
    python3 \
    python3-pip \
    net-tools \
    iputils-ping \
    net-tools \
    iproute2 \
 && rm -rf /var/lib/apt/lists/*

# 2. Configure SSH Daemon directory
RUN mkdir /var/run/sshd

# (Optional) Set root password and enable root login via SSH if preferred:
RUN echo 'root:rootpassword' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 4. Expose default SSH port
EXPOSE 22

# 3. Create entrypoint script that starts SSH and then hands over to CMD
RUN echo '#!/bin/bash\nservice ssh start\nexec "$@"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# 4. Default command opens an interactive bash shell
CMD ["/bin/bash"]