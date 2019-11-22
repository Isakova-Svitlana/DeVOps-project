FROM alpine:3.7
RUN apk add --no-cache bash mongodb su-exec
RUN mkdir -p /data/db && \
   chown -R mongodb /data/db
EXPOSE 27017
CMD [ "mongod", "--bind_ip", "0.0.0.0"]
  
  