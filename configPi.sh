#!/usr/bin/bash

# File to reconfig a rasbperryPI
# just a bootstrap
# This file should only contain enough to start ansible
# and nothing more!!!
# Everything else should be managed by ansible as it has
# better error handling etc...

# TODO
# Download and run the ansible playbook

sudo apt-get -y install ansible openssh-server python gnupg collectd


