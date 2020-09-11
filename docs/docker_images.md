Manages the docker images used by the worker nodes.

# Fields

Available fields:

  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

# Actions

## List

POST: `/v1/docker/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of docker image)
    * name: str
    * version: str
    * url: str
    * registry: str (URL)
    * registry_username: str (only if registry requires login)
    * registry_password: str
    * cuda_version: [CUDA ID](cuda.md)
    * min_hardware_generation: [hardware ID](hardware.md)
    * cpu: bool (works on CPU only?)
    * framework: [framework ID](frameworks.md)
    * domain: [domain name](domains.md)
    * tasks: array of str (train/predict/...)
    * licence: [license ID](licenses.md)


## Load

GET: `/v1/docker/{PK}`

Parameters:

  * PK: int (primary key of docker image)
  
Response:

  * pk: int (primary key of docker image)
  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

## Add

POST: `/v1/docker/create`

Body:

  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

Response:

  * pk: int (primary key of docker image)
  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

## Update

PUT: `/v1/docker/{PK}`

Parameters:

  * PK: int (primary key of docker image)
  
Body: 
 
  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

Response:

  * pk: int (primary key of docker image)
  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

## Partial update

PATCH: `/v1/docker/{PK}`

Parameters:

  * PK: int (primary key of docker image)

Any of the following fields in the body:

  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)

Response:

  * pk: int (primary key of docker image)
  * name: str
  * version: str
  * url: str
  * registry: str (URL)
  * registry_username: str (only if registry requires login)
  * registry_password: str
  * cuda_version: [CUDA ID](cuda.md)
  * min_hardware_generation: [hardware ID](hardware.md)
  * cpu: bool (works on CPU only?)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * tasks: array of str (train/predict/...)
  * licence: [license ID](licenses.md)


## Delete

DELETE: `/v1/docker/{PK}`

Parameters:

  * PK: int (primary key of docker image)
