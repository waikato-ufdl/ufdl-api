Based on the NVIDIA driver installed on a system only
certain versions of CUDA inside docker images will work.

# Fields

* version (10.0)
* full_version (10.0.130)
* min_driver_version (410.48)

# Actions

## List

POST: `/v1/core/cuda/list`

Body (optional): filter specification

## Add

POST: `/v1/core/cuda/create`

Body:

  * version: str
  * full_version: str
  * min_driver_version: str

Response:

  * PK: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

## Update

PUT: `/v1/core/cuda/{PK}`

Parameters:

  * PK: int (primary key of CUDA version)
  
Body: 
 
  * version: str
  * full_version: str
  * min_driver_version: str

Response:

  * PK: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

## Partial update

PATCH: `/v1/core/cuda/{PK}`

Parameters:

  * PK: int (primary key of CUDA version)

Partial update with any of the fields in the body:

  * version: str
  * full_version: str
  * min_driver_version: str

Response:

  * PK: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str


## Delete

DELETE: `/v1/core/cuda/{PK}/`

Parameters:

  * PK: int (primary key of CUDA version)


## Links

* [CUDA/Driver version](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#binary-compatibility)

