# Docker

> [Course URL](https://www.youtube.com/watch?v=RqTEHSBrYFw&t=8580s)

## Main building blocks

- Below are the main commands in docker, you can use help find the commands related to each functionality

```bash
    docker image --help
    docker container --help
    docker volume --help
    docker network --help
```

## Building

- To build a docker image run `docker build -t name:tag .`
  - You can also create a docker compose file and specify the information in that file for building the images
- Here is the docker compose command to build the images `docker compose -f .\docker-compose-build.yml build`

## Running

- To run a docker container `docker run -it ubuntu:22.04`
  - Here we are saying run the ubuntu image with tag 22.04. -i is to attach the current input devices to the container instace, -t is for teletyping
- You can run it in detached mode and expose ports from container to the host system
- You can also give it a name to the container
- Command `docker run -d --name sample-backend -p 9090:8080 teja463/docker-java:latest`
- You can also use the docker compose option to run the containers
  - It is the recommended way because you can define all the services you need, you can run them in the order.
  - You can also attach the containers to networks
  - Users can see how the app should be started
- Command to bring up compose is `docker compose -f .\docker-compose-react-springboot.yml up -d`
  - This will start all the services in the detached mode.
  - It will create a network and attaches all the services defined in the compose file to that network
- Command to bring down the compose `docker compose -f .\docker-compose-react-springboot.yml down`

## Useful commands

- `docker ps` to see all running containers
- `docker ps -a` to see all container even the ones that is stopped
- `docker stop containerid` to stop the container
- `docker exec -it containerid bash` to login into the container. You can change the last command from bash to any other linux command. It will execute that command
- `docker logs containerid` to view logs
- `docker container prune` to remove all containers
