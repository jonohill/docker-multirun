# docker-multirun

A Docker image containing the [multirun](https://github.com/nicolas-van/multirun) binary only. It's not an OS image that you can base yours on, it just contains the multirun binary.

You can use it to add multirun to your image without having to locate/download/extract the appropriate tar for your target platform.

## Usage

In your Dockerfile:

```Dockerfile
FROM debian
# or whatever

# ...

# Will copy it to /usr/local/bin/multirun, or use explicit paths if you prefer
COPY --from=ghcr.io/jonohill/docker-multirun / /

# ...

```
