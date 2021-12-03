#!/usr/bin/env bash
set -le

echo "== Checking prerequisites."

# Check prerequisites.
if [[ ! `command -v docker` ]]; then
  echo "Docker is required to run scripts."
  echo "Please install Docker from https://docs.docker.com/get-docker/ and then try again."
  exit 1
fi

DIR=`printf "%q\n" "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`

echo $DIR

installDir=${DIR:-remote-toolkit}'/remote-toolkit'
echo "== INSTALL DIR"
echo $installDir



echo "Cloning repo."
git clone git@github.com:luis-balam/remote-toolkit.git $installDir
echo "== Finish cloning repo."

echo "== Creating resources folder."
mkdir "$installDir/resources"


DOCKER_IMAGE="torus/remote-toolkit:local"
echo "== Runnining compose."
#docker compose run --rm toolkit
docker build -t $DOCKER_IMAGE .
docker run -it --rm -v $installDir/resources:/usr/bin/remote-toolkit $DOCKER_IMAGE bash






