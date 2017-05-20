FROM python:3
LABEL author="Chris Lunsford <chrlunsf@cisco.com>" \
      maintainer="Armen Martirosyan <armartir@cisco.com>" \
      license="MIT" \
      copyright="Copyright (c) 2017 Cisco Systems, Inc."


# Install Packages
ENV PACKAGES_UPDATED 2017-05-19

# Upgrade & Install System Packages
RUN apt-get -yq update && \
    apt-get -yq upgrade && \
    apt-get -yq install vpnc-scripts && \
    apt-get -yq install openconnect && \
    apt-get -yq install unzip && \
    apt-get -yq install vim && \
    apt-get -yq autoremove && \
    apt-get -yq clean


# Create and set working directory
WORKDIR /root/virl-demo


# Download and extract ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip && \
    rm ngrok-stable-linux-amd64.zip

# Create ngrok config file
RUN mkdir /root/.ngrok2 && \
    echo web_addr: 0.0.0.0:4040 >> /root/.ngrok2/ngrok.yml

# Copy Scripts
COPY docker_launch_bot.sh demo_bot.py virl.py requirements.txt /root/virl-demo/
COPY sims/ /root/virl-demo/sims

# Install Python Packages
RUN pip install -r requirements.txt && \
    rm -r /root/.cache


# Container Parameters
VOLUME ["/root/virl-demo","/root/virl-demo/sims"]

EXPOSE 4040 8080

CMD ["/root/virl-demo/docker_launch_bot.sh"]
