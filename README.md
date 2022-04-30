# Develop and test Ardour on Windows

## Build the dependencies:

Please make sure to clone this repo inside of WSL2's filesystem!
We make heavy use of mounting volumes and this will be much faster when the volumes are inside WSL2.

```
$ docker-compose build
$ docker-compose run tools-builder bash
# ./scripts/ardour-build-tools/x-mingw.sh
```
This step takes A LOT OF TIME.
Also I didn't hardcode this in the Dockerfile, because it happens
that docker may lose internet connection trying to download a dependency.
If that happens to you, comment out the lines in `x-mingw.sh` that already ran, and execute the script again.

## Compile the project

```
$ docker-compose run builder bash
# ./scripts/x-win/compile.sh
```
