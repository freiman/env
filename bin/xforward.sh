#!/bin/bash

USER=freiman
HOST=192.168.1.103

APP=$1

ssh -X -f -T $USER@$HOST $1
