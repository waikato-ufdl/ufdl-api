Manages the output data attached to jobs.

# Fields

  * pk: int (primary key of job output)
  * job: int (primary key of job)
  * name: str
  * type: str
  * data: [file ID]()


# Actions

## Retrieve

Gets the information about a specific job output. Can also be performed by
name/type [from the associated job](jobs.md#get-output-info).

### Method

`GET`

### URL

`/v1/job-outputs/{PK}`

### Parameters

  * `PK`: int (primary key of job output)

### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

### Response

  * pk: int (primary key of job output)
  * job: [job ID](jobs.md)
  * name: str
  * type: str
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null


## Download

Downloads the data for a job output. Can also be performed by
name/type [from the associated job](jobs.md#get-output).

### Method

`POST`

### URL

`/v1/job-outputs/{PK}/download`

### Parameters

  * `PK`: int (primary key of job output)

### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

### Response

  * Binary content of the output.
