kubectl debug -it -n demo \
  sample-app --target=sample-debug \
  --image=asoldatenko/dlv-headless-envs:0.0.2 \
  --share-processes -- sh

# If you don't see a command prompt, try pressing enter.
/ # ps
PID   USER     TIME  COMMAND
    1 root      0:00 /bin/dlv --listen=:40000 --headless=true --log --api-version=2 --accept-multiclient exec /app --
   15 root      0:00 /app
   21 root      0:00 sh
   30 root      0:00 ps
/ #

dlv connect :40000