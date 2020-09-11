Contains information about the registered worker nodes.

# Fields

Available fields:

  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)
  * last seen: timestamp
  * current_job_id: int 

# Actions

## List

POST: `/v1/nodes/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of node)
    * index: int (GPU index, 0 for CPU-only nodes)
    * cpu_mem: int (in bytes)
    * driver_version: str
    * hardware_generation: [hardware ID](hardware.md)
    * gpu_mem: int (in bytes)
    * last seen: timestamp
    * current_job_id: int 


## Load

GET: `/v1/nodes/{PK}`

Parameters:

  * PK: int (primary key of node)
  
Response:

  * pk: int (primary key of node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)
  * last seen: timestamp
  * current_job_id: int 

## Add

POST: `/v1/nodes/create`

Body:

  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)

Response:

  * pk: int (primary key of node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)
  * last seen: timestamp
  * current_job_id: int 

## Update

PUT: `/v1/nodes/{PK}`

Parameters:

  * PK: int (primary key of node)
  
Body: 
 
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)

Response:

  * pk: int (primary key of node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)
  * last seen: timestamp
  * current_job_id: int 

## Partial update

PATCH: `/v1/nodes/{PK}`

Parameters:

  * PK: int (primary key of node)

Any of the following fields in the body:

  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)

Response:

  * pk: int (primary key of node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware ID](hardware.md)
  * gpu_mem: int (in bytes)
  * last seen: timestamp
  * current_job_id: int 


## Delete

DELETE: `/v1/nodes/{PK}`

Parameters:

  * PK: int (primary key of node)
