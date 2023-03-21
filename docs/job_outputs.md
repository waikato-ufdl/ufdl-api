Manages the output data attached to jobs. Each job, as a result of its execution, may upload one or more outputs to
the server.

N.B. The standard `CREATE` action is disallowed for job-outputs. Outputs are instead added to job via the
[add-output action on jobs](jobs.md#add-output).

## Fields

  * pk: int (primary key of job output)
  * job: int (primary key of [job](jobs.md) that this output is attached to)
  * name: str (the name given to the job output)
  * type: str (the [type](job_types.md) of the output)
  * creator: int or null (primary key of the user that created the output)
  * creation_time: timestamp (the date-time that the output was created)
  * deletion_time: timestamp or null (the date-time that the output was soft-deleted, or null if still active)


## Actions

### List

Lists all job-outputs that match a given set of filters.

#### Method

`POST`

#### URL

`/v1/job-outputs/list`

#### Body (optional)
 
  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON array of objects containing each job-output's [fields](#fields)


### Retrieve

Gets the information about a specific job output. Can also be performed by
name/type [from the associated job](jobs.md#get-output-info).

#### Method

`GET`

#### URL

`/v1/job-outputs/{PK}`

#### Parameters

  * `PK`: int (primary key of job output)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the job-output's [fields](#fields)


### Destroy

Soft-deletes a job-output.

#### Method

`DELETE`

#### URL

`/v1/job-outputs/{PK}`

#### Parameters

  * `PK`: int (primary key of job output)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)


### Hard Delete

Hard-deletes a job-output.

#### Method

`DELETE`

#### URL

`/v1/job-outputs/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of job output)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the hard-deleted job-output's [fields](#fields)


### Reinstate

Reinstates a previously soft-deleted job-output.

#### Method

`DELETE`

#### URL

`/v1/job-outputs/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of job output)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the reinstated job-output's [fields](#fields)


### Download

Downloads the data for a job output. Can also be performed by
name/type [from the associated job](jobs.md#get-output).

#### Method

`POST`

#### URL

`/v1/job-outputs/{PK}/download`

#### Parameters

  * `PK`: int (primary key of job output)

#### Body (optional)
 
  * A JSON object containing:

    * filetype: str (overrides the default file extension given to the output's filename)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * Binary content of the output.
