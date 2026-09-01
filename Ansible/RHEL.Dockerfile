FROM redhat/ubi8:latest

# 1. Install Common Developer Tools + OpenSSH Server
# Note: Ansible is installed via pip3 below to avoid EPEL Python 3.12 dependency issues on RHEL 8
RUN dnf update -y && \
    dnf install -y \
        openssh-server \
        sudo \
        gcc \
        gcc-c++ \
        make \
        curl \
        wget \
        git \
        vim \
        nano \
        unzip \
        python3 \
        python3-pip \
        net-tools \
        iputils \
        iproute \
    && dnf clean all

# 3. Configure SSH Daemon and generate required host keys for RHEL
RUN ssh-keygen -A

# 4. Set root password and enable root login via SSH
RUN echo 'root:rootpassword' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# 5. Expose default SSH port
EXPOSE 22

# 6. Create entrypoint script that starts SSH and hands over to CMD
RUN echo $'#!/bin/bash\n/usr/sbin/sshd\nexec "$@"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# 7. Default command opens an interactive bash shell
CMD ["/bin/bash"]