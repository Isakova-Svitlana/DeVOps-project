#!/bin/bash

#!/bin/bash

#$1 - name image
#$2 - tag image
name=$1
numb=$2

old="$(docker ps --all --quiet --filter=name="$name:*")"

if [ -n "$old" ]; then
  docker stop $old && docker rmi $(docker images | grep $1 | awk '{print $3}') --force
fi
  
if [ $1 == "carts" ]
 then
  docker load -i microservices/carts/$name:$numb.tar
  docker run -d --rm -p 8081:80 --name=$name $1name:$numb "--spring.data.mongodb.host=10.156.15.229 --spring.data.mongo.port=27017"
  fi
        
if [ $1 == "frontend" ]
 then
  docker load -i microservices/frontend/$1:$2.tar
  docker run -d --rm -p 8099:8079 --name=$name $name:$numb
 fi
             
if [ $1 == "catalogue" ]
  then
  docker load -i microservices/catalog/$1:$2.tar
  fi  