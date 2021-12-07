#!/usr/bin/env bash
#
# bootstrap.sh
# content-scripts
#
# For details and documentation:
# http://github.com/inkling/content-scripts
#
# Copyright 2015 Inkling Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# This script bootstraps development of content scripts.


echo "Setting up content-scripts development environment..."
echo ""

# Check prerequisites.
# Keep these insync with install.sh
if [[ ! `command -v gem` ]]; then
  echo "RubyGems is required to run style sync scripts."
  echo "Please install RubyGems from https://rubygems.org/pages/download and then try again."
  exit 1
fi

if [[ ! `command -v compass` ]]; then
  echo "Compass is required to run style sync scripts."
  echo "Please run 'sudo gem install compass' and try again."
  exit 1
fi

if [[ ! `command -v python` ]]; then
  echo "Python is required for running python content scripts."
  echo 'Please install Python 2.7+ on your machine.'
  exit 1
elif [[ `python -c 'import sys; print sys.version_info < (2, 7) and "1" or "0"'` != "0" ]]; then
  echo "Python version 2.7 or later is required. Please update the Python version found in your PATH."
  exit 1
fi

if ! `python -c 'import bs4' 2>/dev/null` ; then
  echo 'BeautifulSoup 4 is required to run module migration script.'
  echo 'Please install BeautifulSoup 4 on your machine. See http://www.crummy.com/software/BeautifulSoup/ for instructions.'
  exit 1
fi

# Setup PYTHONPATH
# Prints the directory this script is located in and properly escapes spaces.
#echo "INSTALLING APP"
dir=`printf "%q\n" "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`


export PYTHONPATH=$PYTHONPATH:$dir
export PATH=$PATH:$dir/bin

