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

installDir=${DIR:-remote-toolkit}
echo "Cloning repo."
git clone git@github.com:luis-balam/remote-toolkit.git $installDir
echo "== Finish cloning repo."

echo "== Creating resources folder."
mkdir "$installDir/resources"


DOCKER_IMAGE="torus/remote-toolkit:local"
echo "== Runnining compose."
docker compose up






