Based on the NVIDIA driver installed on a system only
certain versions of CUDA inside docker images will work.

## Links

* [CUDA/Driver version](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#binary-compatibility)


## Fields

  * pk: int (primary key of CUDA instance)
  * version: str (10.0)
  * full_version: str (10.0.130)
  * min_driver_version: str (410.48)


## Actions

### List

Lists the CUDA versions registered with the backend.

#### Method

`POST`

#### URL

`/v1/cuda/list`

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * array of

    * pk: int (primary key of CUDA version)
    * version: str
    * full_version: str
    * min_driver_version: str

### Create

Adds a new CUDA version to the backend.

#### Method

`POST`

#### URL

`/v1/cuda/create`

#### Body

  * version: str
  * full_version: str
  * min_driver_version: str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

### Retrieve

Retrieves the details about a specific CUDA version.

#### Method

`GET`

#### URL

`/v1/cuda/{PK}`

#### Parameters

  * `PK`: int (primary key of CUDA version)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

### Update

Updates the details of a specific CUDA version.

#### Method

`PUT`

#### URL

`/v1/cuda/{PK}`

#### Parameters

  * `PK`: int (primary key of CUDA version)
  
#### Body 
 
  * version: str
  * full_version: str
  * min_driver_version: str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str

### Partial Update

Updates a sub-set of details about a particular CUDA version.

#### METHOD

`PATCH`

#### URL

`/v1/cuda/{PK}`

#### Parameters

  * `PK`: int (primary key of CUDA version)

#### Body

  * version (optional): str
  * full_version (optional): str
  * min_driver_version (optional): str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of CUDA version)
  * version: str
  * full_version: str
  * min_driver_version: str


### Destroy

Removes a CUDA version from the backend.

#### Method

`DELETE`

#### URL

`/v1/cuda/{PK}`

#### Parameters

  * `PK`: int (primary key of CUDA version)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
