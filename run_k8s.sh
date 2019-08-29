#!/usr/bin/env bash

su -c "kubectl run capstone --image=ruipbranco/capstonenddevops:firstversion --port=5555" ubuntu
