#!/usr/bin/env bash
docker run \
  -p 8080:8080 \
  -p 40000:40000 \
  --security-opt="apparmor=unconfined" \
  --cap-add=SYS_PTRACE t
