# docker-ethminer

This is a docker harness for running an nVidia CUDA GPU miner.

There is an example of running four separate miners in the `docker-compose.yml` file as well.

This works with both `x86_64` and `ppc64le` architecture hosts with nVidia GPUs.

# Dependencies:

Make sure you have `nvidia-docker` installed first.

The primary reason is the creation of the `nvidia_driver_387.36` volume.

Your installed nvidia driver version may differ from `387.36`.

# usage:

Edit `docker-compose.yml` to:

- Replace the `387.36` with your currently installed nvidia driver version.

Edit `.env` or set environment variables for `docker-compose` to use.

Then run:

    ARCH=$(uname -p) docker-compose up -d

