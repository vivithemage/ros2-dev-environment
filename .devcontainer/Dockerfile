FROM ros:humble
ARG ROS_DISTRO=humble
ARG USERNAME=vivi
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
RUN apt-get install -y ros-$ROS_DISTRO-rviz2

# Elfin dependancies
RUN apt-get install -y ros-humble-joint-trajectory-controller ros-humble-controller-manager ros-humble-trajectory-msgs ros-humble-gazebo-ros2-control* ros-humble-position-controllers
RUN apt-get install -y build-essential libgtk-3-dev ros-humble-moveit ros-humble-ament*
RUN pip3 install wxpython transforms3d

ENV SHELL /bin/bash

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
CMD ["/bin/bash"]
