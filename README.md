# neo-sandbox

Neovim-based development environment.

## Build

First copy `.gitconfig.example` to `.gitconfig` and edit the `name` and `email`
fields.

```sh
docker build . -t neo
```

## Create Container

```sh
docker run \
  -dt \
  --net=host \
  --name my-sandbox \
  -v "$(pwd)/my-mount":/root/my-mount \
  neo
```

This starts the container in the background. Doing it this way allows you to
connect multiple shells and persist the state until you're ready to close it.

**Note**: `--net=host` grants permissive network access. Use something more
granular if you need it.

## Connect to Container

```sh
docker exec -it my-sandbox zsh
```

**Note**: By design, `git` can't see your ssh keys. You need to do your push
and pull commands from the host machine. Otherwise you can use `git` normally.

## Remove Container

```sh
docker stop my-sandbox
docker rm my-sandbox
```

**Note**: `kill` is much faster than `stop` if you're not concerned about
container processes stopping gracefully.
