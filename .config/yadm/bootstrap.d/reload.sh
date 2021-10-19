#!/bin/bash

# Reloading tmux but it likes to be difficult so we have to open a session in the bg first
tmux new-session -s 'Session1' -d
