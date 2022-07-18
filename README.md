# Ada Vim Editor

AVE is a ready-to-use NeoVim editor inside a docker image, preconfigured for writing Ada program text.

# Setup

You need to [install docker](https://docs.docker.com/get-docker/) first.

# Use

To use, open a terminal and run:

```
docker run -it -v $(pwd):/workdir --workdir=/workdir tmcglinn/ave:latest
```

In the command above we are mounting the current working directory and switching to it.
If you need access to other directories from AVE, add more pairs of arguments like:

```
-v LOCAL_DIRECTORY:MAPPED_DIRECTORY
```

Where LOCAL_DIRECTORY is replaced by a directory on your computer that you need access to,
and MAPPED_DIRECTORY is what it will be named as inside AVE.

