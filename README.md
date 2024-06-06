# snakemake-hello-world

Minimal working map-reduce pattern in Snakemake (with containerization)

## Instructions

You'll need to install Singularity + LIMA + QEMU to run the pipeline with
containers inside of a VM.

- Install Apptainer (nee Singularity) by following [these
  instructions](https://apptainer.org/docs/admin/main/installation.html#installation-on-windows-or-mac)
- From this repo, `limactl shell apptainer`
- (In VM) Copy this directory to `~` inside of VM so you can write to it
- (In VM) `sudo apt-get install -y python3 python3-pip && pip3 install snakemake setuptools`
- (In VM) `snakemake -j 1 --use-singularity`
