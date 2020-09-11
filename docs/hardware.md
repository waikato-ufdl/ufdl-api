For defining the graphics card hardware generations.

# Fields

Available fields:

  * generation: str
  * min_compute_capability: float (inclusive)
  * max_compute_capability: float (exclusive)

# Actions

## List

POST: `/v1/hardware/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of hardware)
    * generation: str
    * min_compute_capability: float
    * max_compute_capability: float


## Load

GET: `/v1/hardware/{PK}`

Parameters:

  * PK: int (primary key of hardware)
  
Response:

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

## Add

POST: `/v1/hardware/create`

Body:

  * generation: str
  * min_compute_capability: float (incl)
  * max_compute_capability: float (excl)

Response:

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

## Update

PUT: `/v1/hardware/{PK}`

Parameters:

  * PK: int (primary key of hardware)
  
Body: 
 
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

Response:

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

## Partial update

PATCH: `/v1/hardware/{PK}`

Parameters:

  * PK: int (primary key of hardware)

Any of the following fields in the body:

  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

Response:

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float


## Delete

DELETE: `/v1/hardware/{PK}`

Parameters:

  * PK: int (primary key of hardware)

## Links

* [CUDA/Hardware](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#support-hardware__table-hardware-support)
