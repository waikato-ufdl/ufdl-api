For defining the graphics card hardware generations.

## Links

* [CUDA/Hardware](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#support-hardware__table-hardware-support)


## Fields

  * generation: str
  * min_compute_capability: float (inclusive)
  * max_compute_capability: float (exclusive)

## Actions

### List

#### Method

`POST`

#### URL

`/v1/hardware/list`

#### Body (optional)
 
  * [filter specification](filtering.md)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * array of

    * pk: int (primary key of hardware)
    * generation: str
    * min_compute_capability: float
    * max_compute_capability: float


### Create

#### Method

`POST`

#### URL

`/v1/hardware/create`

#### Body

  * generation: str
  * min_compute_capability: float (incl)
  * max_compute_capability: float (excl)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float


### Retrieve

#### Method

`GET`

#### URL

`/v1/hardware/{PK}`

#### Parameters

  * `PK`: int (primary key of hardware)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

### Update

#### Method

`PUT`

#### URL

`/v1/hardware/{PK}`

#### Parameters

  * `PK`: int (primary key of hardware)

#### Body 
 
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float


### Partial update

#### Method

`PATCH`

#### URL

`/v1/hardware/{PK}`

#### Parameters

  * `PK`: int (primary key of hardware)
  
#### Body

  * generation (optional): str
  * min_compute_capability (optional): float
  * max_compute_capability (optional): float

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float


### Destroy

#### Method

`DELETE`

#### URL

`/v1/hardware/{PK}`

#### Parameters

  * `PK`: int (primary key of hardware)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)


### Get Hardware Generation

#### Method

`GET`

#### URL

`/v1/hardware/get-hardware-generation/{COMPUTE}`

#### Parameters

  * `COMPUTE`: float
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * pk: int (primary key of hardware)
  * generation: str
  * min_compute_capability: float
  * max_compute_capability: float
