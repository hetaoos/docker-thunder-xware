if [ ! -d data ]; then
    mkdir -p data
fi

docker run -d \
        --name=xware \
        --restart=always \
        -v $(pwd)/data:/app/mnt/TDDOWNLOAD \
        hetaoos/docker-thunder-xware:latest
