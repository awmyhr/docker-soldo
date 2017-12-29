# Docker Container for Soldo _(docker-soldo)_

> A container for the [Soldo](https://github.com/monselice/sld) project.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)

## Install

Run build.sh. This will create a temporary container to build sld[dmwp]. Then it
will build the actual run container. Needed files are copied from the build to
the run container. Finally it will clean up after itself.

## Usage

Running this container as a binary will call sldd. With no params you'll get the
standard help output:

    docker run --rm -it awmyhr/docker-soldo 

One can easily run sldd like normal:

    docker run --rm -it awmyhr/docker-soldo --mining-threads 1 --start-mining [WALLET_ADDRESS]

However, this will necessitate re-downloading the blockchain every time.

I recommend running it daemonized, with a volume mount for the blockchain:

    docker run -itd --name soldo \
        -v "$HOME/.sld:/root/.sld"  \
        awmyhr/docker-soldo --mining-threads 1 --start-mining [WALLET_ADDRESS]

You can then view the output of sldd via 'docker logs -f soldo'. You can attach
to the process with 'docker attach soldo', then disconnect again with CTRL-p CTRL-q.
The docker attach command is also a good way to issue the 'exit' command to sldd.
It should be noted that any files created by this container will be root owned.

If you want to also run wallet commands, then add a volume for your wallet file:

    docker run -itd --name soldo \
        -v "$HOME/.sld:/root/.sld"  \
        -v "/path/to/walletdir:/wallet" \
        awmyhr/docker-soldo --mining-threads 1 --start-mining [WALLET_ADDRESS]

You can then run sldw like so:

    docker exec -it soldo /root/sldw --wallet-file=/wallet/walletfile

Remember to add a ':z' to the volume if you're on a SELinux enabled system:

    docker run -itd --name soldo \
        -v "$HOME/.sld:/root/.sld:z"  \
        -v "/path/to/walletdir:/wallet:z" \
        awmyhr/docker-soldo --mining-threads 1 --start-mining [WALLET_ADDRESS]

## Maintaniers

- awmyhr <awmyhr@gmail.com>

## Contribute

PRs accepted.

You can also donate Soldo, my address is:

    LdA2AXu6pP5AQofPH8yrCjBWqo4N5gjrtiqfYxQZ8ytAYvnrJn86Qhy7jYc5fooWPpSXHEjzyryMUBsyy3ntr8Qk23eL2Jm

## License

Apache-2.0 (c) 2017 awmyhr

