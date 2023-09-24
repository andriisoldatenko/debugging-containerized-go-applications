## Run it in first terminal
docker run \
    --rm \
    -p 8080:8080 \
    -p 40000:40000 \
    dlv-headless



### Run it in second terminal
dlv connect :40000