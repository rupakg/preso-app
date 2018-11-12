# run the backend container and don't expose the port to host
docker run -d --name preso-slides rupakg/preso-slides

# start the nginx container, linking to the backend service
docker run --name preso-frontend \
    -d --restart=always \
    --link preso-slides:backend_service \
    -v `pwd`/nginx.conf:/etc/nginx/nginx.conf:ro \
    -v `pwd`/.htpasswd:/etc/nginx/.htpasswd:ro \
    -p 8080:8080 \
    nginx
