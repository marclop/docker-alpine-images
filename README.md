# Alpine Linux docker images

This repository contains all the docker images with different software that use alpine linux as the base OS.

## Usage

If no component is specified, elasticsearch is asumed, and if not version is specified, biggest version is specified.
```
$ make build COMPONENT="logstash" VERSION="1.5"
```
