## Run it in first terminal
docker run \
    --rm \
    -p 8080:8080 \
    -p 40000:40000 \
    -e REMOTE_DEBUG_PORT=40000 \
    dlv-headless

API server listening at: [::]:40000
2023-09-24T11:23:54Z warning layer=rpc Listening for remote connections (connections are not authenticated nor encrypted)
2023-09-24T11:23:54Z info layer=debugger launching process with args: [/app]
2023-09-24T11:23:55Z debug layer=debugger Adding target 12 "/app"

