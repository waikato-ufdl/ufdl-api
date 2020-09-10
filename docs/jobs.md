Manages the generated jobs.

# Fields

Available fields:

  * description: str
  * docker_image: [docker image ID](docker_images.md)
  * template: [job template ID](job_templates.md)
  * input_values: map of (name: str, value: str)
  * parameter_values: map of (name: str, value: str)
  * outputs: array of (name: str, type: str)
  * node: [node ID](nodes.md)
  * error: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp
  * start_time: timestamp
  * end_time: timestamp

# Actions

## List

POST: `/v1/core/jobs/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of job)
    * description: str
    * docker_image: [docker image ID](docker_images.md)
    * template: [job template ID](job_templates.md)
    * input_values: map of (name: str, value: str)
    * parameter_values: map of (name: str, value: str)
    * outputs: array of (name: str, type: str)
    * node: [node ID](nodes.md)
    * error: str
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp
    * start_time: timestamp
    * end_time: timestamp


## Load

GET: `/v1/core/jobs/{PK}`

Parameters:

  * PK: int (primary key of job)
  
Response:

  * pk: int (primary key of job)
  * description: str
  * docker_image: [docker image ID](docker_images.md)
  * template: [job template ID](job_templates.md)
  * input_values: map of (name: str, value: str)
  * parameter_values: map of (name: str, value: str)
  * outputs: array of (name: str, type: str)
  * node: [node ID](nodes.md)
  * error: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp
  * start_time: timestamp
  * end_time: timestamp

## Add output

POST: `/v1/core/jobs/{PK}/outputs/{NAME}`

Parameters: 

  * PK: the primary key of the job
  * NAME: the name of the output to add

Byte array attachment is the binary content of the output. 

## Get output

GET: `/v1/core/jobs/{PK}/outputs/{NAME}`

Parameters: 

  * PK: the primary key of the job
  * NAME: the name of the output to retrieve

Returned byte array is the binary content of the output. 

## Delete output

DELETE: `/v1/core/jobs/{PK}/outputs/{NAME}`

Parameters: 

  * PK: the primary key of the job
  * NAME: the name of the output to delete

## Delete

DELETE: `/v1/core/jobs/{PK}[/hard]`

Parameters:

  * PK: int (primary key of job)

Notes:

  * Omitting `/hard` from URL only flags it as deleted, it can be reinstated

## Reinstate

DELETE: `/v1/core/jobs/{PK}/reinstate`

Parameters:

  * PK: int (primary key of job)

Notes:

  * Undeletes a previously soft-deleted job
