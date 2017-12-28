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
will build the actual run container, then will clean up after itself.

## Usage

This can be run with a simple:

    docker run --rm -it awmyhr/docker-soldo [WALLET_ADDRESS]

However, this will necessitate re-downloading the blockchain every time, amongst
other problems.

I recommend running it daemonized, with a volume mount for the blockchain:

    docker run -itd --name soldo \
        -v "$HOME/.sld:/root/.sld"  \
        -e ADDRESS='WALLET_ADDRESS' \
        awmyhr/docker-soldo

You can then view the output of sldd via 'docker logs -f soldo'. You can attach
to the process with 'docker attach soldo', then disconnect again with CTRL-p CTRL-q.
Remember to add a ':z' to the volume if you're on a SELinux enabled system.

If you want to also run wallet commands, then add a volume for your wallet file:

    docker run -itd --name soldo \
        -v "$HOME/.sld:/root/.sld"  \
        -v "path/to/wallet:/root/.wallet" \
        -e ADDRESS='WALLET_ADDRESS' \
        awmyhr/docker-soldo

You can then run sldw like so:

    docker exec -it soldo /root/sldw --wallet-file=/root/.wallet

## Maintaniers

- awmyhr <awmyhr@gmail.com>

## Contribute

PRs accepted.

You can also donate Soldo, my address is:

    LdA2AXu6pP5AQofPH8yrCjBWqo4N5gjrtiqfYxQZ8ytAYvnrJn86Qhy7jYc5fooWPpSXHEjzyryMUBsyy3ntr8Qk23eL2Jm

## License

Apache-2.0 (c) 2017 awmyhr

