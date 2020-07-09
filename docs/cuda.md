Based on the NVIDIA driver installed on a system only
certain versions of CUDA inside docker images will work.

# Fields

* cuda_version (10.0)
* cuda_full_version (10.0.130)
* driver_min_version (410.48)

# Actions

## Add mapping

requires:

  * cuda_version
  * cuda_full_version
  * driver_min_version

## Update harware

partial update of any of these fields:

  * cuda_version
  * cuda_full_version
  * driver_min_version


## Delete hardware

requires:

  * cuda_version


## Links

* [CUDA/Driver version](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#binary-compatibility)

