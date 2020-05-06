# Docker Slim

A Docker container that can be used to slimify existing images. The image is
based on `docker:stable-dind` but has a modified [entrypoint](https://docs.docker.com/engine/reference/builder/#entrypoint).

As such, the container must be launched with privileged rights. When running
on Gitlab the gitlab executor must have the privileged feature turned on.

```
docke run --privileged -ti docker-slim
```