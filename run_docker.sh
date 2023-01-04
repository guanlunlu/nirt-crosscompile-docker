#!/usr/bin/env bash

ARGS=("$@")

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
XAUTH=/tmp/.docker.xauth

if [ ! -f $XAUTH ]; then
    xauth_list=$(xauth nlist $DISPLAY)
    xauth_list=$(sed -e 's/^..../ffff/' <<<"$xauth_list")
    if [ ! -z "$xauth_list" ]; then
        echo "$xauth_list" | xauth -f $XAUTH nmerge -
   else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

#Prevent executing "docker run" when xauth failed.
if [ ! -f $XAUTH ]; then
    echo "[$XAUTH] was not properly created. Exiting..."
   exit 1
fi

docker run -it \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTH \
    -v "$XAUTH:$XAUTH" \
    -v "/home/guanlunlu/nirt-crosscompile-docker/ni_c_project:/root/ni_c_project" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix" \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "/dev:/dev" \
    --workdir "/root" \
    --user "root:root" \
    --name nirt-crosscompile-container \
    --network host \
    --rm \
    --privileged \
    guanlunlu/nirt-crosscompile \
    bash

    # -v "ni_c_project:/root/ni_c_project" \
    # -v "/home/$USER/docker-localization-ws/euro_ws:/root/euro_ws" \
# osrf/ros:noetic-desktop-full \
