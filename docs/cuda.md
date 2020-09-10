Based on the NVIDIA driver installed on a system only
certain versions of CUDA inside docker images will work.

# Fields

Available fields:

  * version: str (10.0)
  * full_version: str (10.0.130)
  * min_driver_version: str (410.48)

# Actions

## List

POST: `/v1/core/cuda/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * version: str
    * full_version: str
    * min_driver_version: str

## Add

POST: `/v1/core/cuda/create`

Body:

  * version: str
  * full_version: str
  * min_driver_version: str

Response:

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

## Load

GET: `/v1/core/cuda/{PK}`

Parameters:

  * PK: int (primary key of CUDA version)
  
Response:

  * pk: int (primary key of CUDA version)
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

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

## Partial update

PATCH: `/v1/core/cuda/{PK}`

Parameters:

  * PK: int (primary key of CUDA version)

Any of the following fields in the body:

  * version: str
  * full_version: str
  * min_driver_version: str

Response:

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str


## Delete

DELETE: `/v1/core/cuda/{PK}`

Parameters:

  * PK: int (primary key of CUDA version)


## Links

* [CUDA/Driver version](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#binary-compatibility)

