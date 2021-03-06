# Docker-based deploy

A complete stack to deploy the dependency services required by the AMS application.

**Missing notes about required server configuration before starting the stack.**

## Docker for app

A self-contained environment to run the webapp based on Python 3.8.10 and Alpine Linux images.

## S.O. settings

The image of the docker container depends on the Docker environment. To prepare the system for operation, make changes based on the official documentation.

Mandatory:
 - https://docs.docker.com/engine/install/
 - https://docs.docker.com/engine/install/linux-postinstall/

Optional:
 - https://docs.docker.com/compose/install/


## Building the app image

The preconditions is:
 - Review and/or change the version number using git tags before building the image, because successive builds will overwrite the previous image that has the same version number;

The build script uses the latest repository tag to tag the docker image by running the following command.
```sh
# example to get more recent repository tag
git describe --tags --abbrev=0
```

Using a shell command line terminal, go to the docker directory and run the webapp-build.sh script.

```sh
cd docker/
./webapp-build.sh
```

## Container stack startup (docker compose)

The preconditions is:
 - Change the **docker/webapp-secrets.env** with the necessary database parameters so that the application back-end reaches the target database;
 - Change the SCRIPT_NAME and GEOSERVER_URL environment variables in the docker-compose.yaml file to their compatible runtime values.;

Using the docker-compose command and the **docker/docker-compose.yaml** file to activate the weebapp service.

To up the stack in detached mode:
```sh
cd docker/webapp/
docker-compose -f docker-compose.yaml up -d
```

To down the stack:
```sh
cd docker/webapp/
docker-compose -f docker-compose.yaml down
```

## Container startup (without docker compose)

The preconditions is:
 - Change the **docker/webapp-secrets.env** with the necessary database parameters so that the application back-end reaches the target database;
 - Change the SCRIPT_NAME and GEOSERVER_URL environment variables in the command below to their compatible runtime values.;

Use the docker command line. Change the <x.y.z> to the desired version.

```sh
docker run --env SCRIPT_NAME="/ams" \
--env GEOSERVER_URL="http://terrabrasilis.dpi.inpe.br/geoserver/" \
--env-file docker/webapp-secrets.env \
-d --rm --name ams-webapp terrabrasilis/ams-webapp:v<x.y.z>
```