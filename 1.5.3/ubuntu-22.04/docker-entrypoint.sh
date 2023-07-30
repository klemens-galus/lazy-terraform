#!/bin/bash

cd ~/lazy-terraform

sudo chown -R terraform:terraform ~/lazy-terraform

exec "$@"