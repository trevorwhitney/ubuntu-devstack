#!/bin/bash

/devstack/tools/create-stack-user.sh
chown -R stack:stack /devstack
su stack
/devstack/stack.sh
