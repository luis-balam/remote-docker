#!/usr/bin/env bash
set -e

echo "== Checking prerequisites."

# Check prerequisites.
if [[ ! `command -v docker` ]]; then
  echo "Docker is required to run scripts."
  echo "Please install Docker from https://docs.docker.com/get-docker/ and then try again."
  exit 1
fi

DIR=`printf "%q\n" "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`

echo $DIR

#installDir=${DIR:-remote-toolkit}'/remote-toolkit'
installDir=${DIR:-remote-toolkit}'/inkling-rsync'
echo "== INSTALL DIR"
echo $installDir


echo "Cloning repo."
git clone git://github.com/inkling/content-scripts.git $installDir
echo "== Finish cloning repo."

cp -R "/svn" "$installDir/svnBAK"
cp -R "/sync" "$installDir/syncBAK"
#echo "== Creating resources folder."
#mkdir "$installDir/resources"


#DOCKER_IMAGE="torus/remote-toolkit:local"
#echo "== Docker image."
#echo $DOCKER_IMAGE

#echo "== Working directory"
#cd $installDir

#echo "== Runnining compose."
#docker compose run --rm toolkit
#docker build -t $DOCKER_IMAGE .
#docker run -it --rm -v "$installDir/resources:/usr/bin/remote-toolkit/resources" $DOCKER_IMAGE bash
#docker compose -f toolkit-compose.yml up
docker compose up -d
docker exec -it remote-toolkit-dev-toolkit-1 bash
#torus/remote-toolkit:local
#docker exec -it torus/remote-toolkit:local bash




