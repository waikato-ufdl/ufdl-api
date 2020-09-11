Manages the job templates.

# Fields

Available fields:

  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * inputs: array of (name: str, type: str, options: str, help: str)
  * parameters: array of (name: str, type: str, default: str, help: str)
  * executor_class: str
  * required_packages: str
  * body: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

# Actions

## List

POST: `/v1/job-templates/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of job template)
    * name: str
    * version: int
    * scope: str (public/project/user)
    * framework: [framework ID](frameworks.md)
    * domain: [domain name](domains.md)
    * type: str (train/predict/...)
    * description: str
    * inputs: array of (name: str, type: str, options: str, help: str)
    * parameters: array of (name: str, type: str, default: str, help: str)
    * executor_class: str
    * required_packages: str
    * body: str
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp


## Load

GET: `/v1/job-templates/{PK}`

Parameters:

  * PK: int (primary key of job template)
  
Response:

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * inputs: array of (name: str, type: str, options: str, help: str)
  * parameters: array of (name: str, type: str, default: str, help: str)
  * executor_class: str
  * required_packages: str
  * body: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add

POST: `/v1/job-templates/create`

Body:

  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * executor_class: str
  * required_packages: str
  * body: str

Response:

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * inputs: array of (name: str, type: str, options: str, help: str)
  * parameters: array of (name: str, type: str, default: str, help: str)
  * executor_class: str
  * required_packages: str
  * body: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add input

POST: `/v1/job-templates/{PK}/inputs/{NAME}`

Parameters:

  * PK: int (primary key of job template)
  * NAME: str (name of the input)

Body:

  * type: str (bool/int/float/str/dataset/model/joboutput)
  * options: str
  * help: str

## Remove input

DELETE: `/v1/job-templates/{PK}/inputs/{NAME}`

Parameters:

  * PK: int (primary key of job template)
  * NAME: str (name of the input)

## Add parameter

POST: `/v1/job-templates/{PK}/parameters/{NAME}`

Parameters:

  * PK: int (primary key of job template)
  * NAME: str (name of the parameter)

Body:

  * type: str (bool/int/float/str/dataset/model/joboutput)
  * default: str (the default value)
  * help: str

## Remove parameter

DELETE: `/v1/job-templates/{PK}/parameters/{NAME}`

Parameters:

  * PK: int (primary key of job template)
  * NAME: str (name of the parameter)

## Update

PUT: `/v1/job-templates/{PK}`

Parameters:

  * PK: int (primary key of job template)
  
Body: 
 
  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * executor_class: str
  * required_packages: str
  * body: str

Response:

  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * inputs: array of (name: str, type: str, options: str, help: str)
  * parameters: array of (name: str, type: str, default: str, help: str)
  * executor_class: str
  * required_packages: str
  * body: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Partial update

PATCH: `/v1/job-templates/{PK}`

Parameters:

  * PK: int (primary key of job template)

Any of the following fields in the body:

  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * executor_class: str
  * required_packages: str
  * body: str

Response:

  * name: str
  * version: int
  * scope: str (public/project/user)
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * type: str (train/predict/...)
  * description: str
  * inputs: array of (name: str, type: str, options: str, help: str)
  * parameters: array of (name: str, type: str, default: str, help: str)
  * executor_class: str
  * required_packages: str
  * body: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp


## Delete

DELETE: `/v1/job-templates/{PK}[/hard]`

Parameters:

  * PK: int (primary key of job template)

Notes:

  * Omitting `/hard` from URL only flags it as deleted, it can be reinstated

## Reinstate

DELETE: `/v1/job-templates/{PK}/reinstate`

Parameters:

  * PK: int (primary key of job template)

Notes:

  * Undeletes a previously soft-deleted job template

## New job

POST:  `/v1/job-templates/{PK}/create-job`

Parameters:

  * PK: int (primary key of job template)

Body:

  * docker_image: [docker image ID](docker_images.md)
  * description: str (optional)
  * input_values: map of input values (name/value)
  * parameter_values: map of parameter values (name/value)
  
Response:

  * [job](jobs.md)
