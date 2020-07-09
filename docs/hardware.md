NVIDIA cards use belong to certain hardware generations, which have
codenames. This table contains the hardware names and their compute
capability.


# Fields

* generation
* compute_capability

# Actions

## Add hardware

requires:

  * generation
  * compute_capability

## Update harware

partial update of any of these fields:

  * generation
  * compute_capability


## Delete hardware

requires:

  * generation


## Links

* [Hardware support](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#support-hardware)

