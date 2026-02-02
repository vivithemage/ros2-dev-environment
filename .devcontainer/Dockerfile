ARG ROS_DISTRO=humble
FROM ros:${ROS_DISTRO}
ARG USERNAME=username
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Delete user with the same UID
RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi

# Set up user and sudo
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-pip \
    wget \
    vim \
    tmux \
    bash-completion \
    # libgtk-3-dev \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Gazebo sim
RUN apt-get install curl lsb-release gnupg -y
RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] https://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update
RUN apt-get install gz-harmonic -y

ENV SHELL /bin/bash

RUN pip3 install \
    pre-commit
    # pytest \
    # pytest-cov \

RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> /home/$USERNAME/.bashrc
USER $USERNAME
CMD ["/bin/bash"]