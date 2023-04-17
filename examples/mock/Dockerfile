#FROM jamesdbloom/mockserver 
FROM mockoon/cli:latest 
COPY test-api.yaml /data/test-api.yaml 
EXPOSE 3000 
ENTRYPOINT ["mockoon-cli", "start", "--data data","--hostname", "0.0.0.0", "--daemon-off"]
