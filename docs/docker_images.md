Manages the docker images used by the worker nodes.

## Fields

  * pk: int (primary key of the Docker image)
  * name: str
  * version: str
  * url: str
  * registry_url: str (URL)
  * registry_username: str or null (null if registry doesn't require login)
  * registry_password: str or null (null if registry doesn't require login)
  * cuda_version: JSON representation of the Docker image's [CUDA version](cuda.md#fields)
  * framework: JSON representation of the Docker image's [framework](frameworks.md#fields)
  * domain: str (name of the [domain](domains.md) the Docker image operates in)
  * tasks: array of str (names of [job-contracts](job_contracts.md) that the Docker image can be used with e.g. Train/Predict/...)
  * min_hardware_generation: JSON representation of the Docker image's [minimum required hardware generation](hardware.md#fields) or null
  * cpu: bool (works on CPU only?)
  * licence: str (name of the Docker image's [license](licenses.md))

## Actions

### List

Lists the Docker images present on the server.

#### Method

`POST`

#### URL

`/v1/docker/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each Docker image's [fields](#fields)


### Create

Creates a new Docker image.

#### Method

`POST`

#### URL

`/v1/docker/create`

#### Body

  * name: str
  * version: str
  * url: str
  * registry_url: str (URL)
  * registry_username: str or null (null if registry doesn't require login)
  * registry_password: str or null (null if registry doesn't require login)
  * cuda_version: str ([CUDA version-string](cuda.md#fields))
  * framework: int ([framework primary-key](frameworks.md#fields))
  * domain: str (name of the [domain](domains.md) the Docker image operates in)
  * tasks: array of str (names of [job-contracts](job_contracts.md) that the Docker image can be used with e.g. Train/Predict/...)
  * min_hardware_generation: ([minimum required hardware generation-string](hardware.md#fields)) or null
  * cpu: bool (works on CPU only?)
  * licence: str (name of the Docker image's [license](licenses.md))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created Docker image's [fields](#fields)


### Retrieve

Gets the information about a specific Docker image.

#### Method

`GET`

#### URL

`/v1/docker/{PK}`

#### Parameters

  * `PK`: int (primary key of Docker image)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the Docker image's [fields](#fields)


### Update

Updates a specific Docker image.

#### Method

`PUT`

#### URL

`/v1/docker/{PK}`

#### Parameters

  * `PK`: int (primary key of Docker image)

#### Body

  * JSON object containing:

    * name: str
    * version: str
    * url: str
    * registry_url: str (URL)
    * registry_username: str or null (null if registry doesn't require login)
    * registry_password: str or null (null if registry doesn't require login)
    * cuda_version: str ([CUDA version-string](cuda.md#fields))
    * framework: int ([framework primary-key](frameworks.md#fields))
    * domain: str (name of the [domain](domains.md) the Docker image operates in)
    * tasks: array of str (names of [job-contracts](job_contracts.md) that the Docker image can be used with e.g. Train/Predict/...)
    * min_hardware_generation: ([minimum required hardware generation-string](hardware.md#fields)) or null
    * cpu: bool (works on CPU only?)
    * licence: str (name of the Docker image's [license](licenses.md))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated job's [fields](#fields)


### Partial Update

Updates a specific Docker image.

#### Method

`PATCH`

#### URL

`/v1/docker/{PK}`

#### Parameters

  * `PK`: int (primary key of Docker image)

#### Body

  * JSON object containing:

    * name (optional): str
    * version (optional): str
    * url (optional): str
    * registry_url (optional): str (URL)
    * registry_username (optional): str or null (null if registry doesn't require login)
    * registry_password (optional): str or null (null if registry doesn't require login)
    * cuda_version (optional): str ([CUDA version-string](cuda.md#fields))
    * framework (optional): int ([framework primary-key](frameworks.md#fields))
    * domain (optional): str (name of the [domain](domains.md) the Docker image operates in)
    * tasks (optional): array of str (names of [job-contracts](job_contracts.md) that the Docker image can be used with e.g. Train/Predict/...)
    * min_hardware_generation (optional): ([minimum required hardware generation-string](hardware.md#fields)) or null
    * cpu (optional): bool (works on CPU only?)
    * licence (optional): str (name of the Docker image's [license](licenses.md))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated job's [fields](#fields)


### Destroy

Attempts to delete a Docker image from the server. The Docker image will only be deleted
if no references are held to it by other models on the server.

#### Method

`DELETE`

#### URL

`/v1/docker/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)
