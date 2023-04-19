Manages the generated jobs.

## Fields

  * pk: int (primary key of job)
  * template: JSON object containing:

    * pk: [job template ID](job_templates.md) (primary-key of the job-template this job was created from)
    * name: str (the name of the job-template)
    * version: int (the version of the job-template)

  * parent: int or null (primary key of parent job, or null if job has no parent)
  * start_time: timestamp or null (time the job was started, or null if not yet started)
  * end_time: timestamp or null (time the job was finished, or null if not yet finished)
  * error_reason: str or null (the reason the job failed, or null if it hasn't failed)
  * input_values: JSON object from input names to:

    * value: JSON (the JSON representation of the input value)
    * type: str (the string representation of the input value's [type](job_types.md))

  * parameter_values: null or JSON object from parameter names to:

    * value: JSON (the JSON representation of the parameter value)
    * type: str (the string representation of the parameter value's [type](job_types.md))

  * node: [node ID](nodes.md) or null (the node performing the job, or null if no node has acquired it yet)
  * description: str (a description of the purpose of the job)
  * outputs: JSON array of:

    * pk: int (the primary-key of the [job-output](job_outputs.md))
    * name: str (the name of the output)
    * type: str (the [type](job_types.md) of the output)

  * is_cancelled: bool (whether the job has been cancelled)
  * creator: int or null (primary key of the [user](users.md) that created the output)
  * creation_time: timestamp (the date-time that the output was created)
  * deletion_time: timestamp or null (the date-time that the output was soft-deleted, or null if still active)


## Actions

### List

Lists the jobs present on the server.

#### Method

`POST`

#### URL

`/v1/jobs/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each job's [fields](#fields)


### Retrieve

Gets the information about a specific job.

#### Method

`GET`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the job's [fields](#fields)


### Update

Updates the description of a specific job.

#### Method

`PUT`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * JSON object containing:

    * description: str (the new description for the job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated job's [fields](#fields)


### Partial Update

Updates the description of a specific job.

#### Method

`PATCH`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * JSON object containing:

    * description: str (the new description for the job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated job's [fields](#fields)


### Destroy

Flags a job as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)


### Add Output

Adds an output (with data) to a job.

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}`

#### Parameters

  * `PK`: the primary key of the job
  * `NAME`: the name of the output to add
  * `TYPE`: the type of the output to add

#### Body

  * Binary content of the output.

#### Permissions

  * Either of
    * [user is an admin](permissions.md#isadminuser)
    * [node has acquired the job](permissions.md#nodeownsjob)
    
#### Response

  * JSON object containing the [fields](job_outputs.md#fields) of the added job-output.


### Delete Output

Removes an output from a job.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}`

#### Parameters

  * `PK`: the primary key of the job
  * `NAME`: the name of the output to delete
  * `TYPE`: the type of the output to delete

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](job_outputs.md#fields) of the deleted job-output.


### Get Output

Downloads the output data of a job output.

#### Method

`GET`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}`

#### Parameters

  * `PK`: the primary key of the job
  * `NAME`: the name of the output to retrieve
  * `TYPE`: the type of the output to retrieve

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * Binary content of the output.


### Get Output Info

Gets the meta-data of a job output.

#### Method

`GET`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}/info`

#### Parameters

  * `PK`: the primary key of the job
  * `NAME`: the name of the output to delete
  * `TYPE`: the type of the output to delete

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * JSON object containing the [fields](job_outputs.md#fields) of the job-output.


### Acquire Job

Allows a node to reserve a job for exclusive access (so it can enact
the job).

#### Method

`GET`

#### URL

`/v1/jobs/{PK}/acquire`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * Both:
    * [accessed by a node](permissions.md#isnode); and
    * [job is not a meta-job](permissions.md#jobisworkable)

#### Response

  * JSON object containing the [fields](#fields) of the acquired job.


### Release Job

Allows a node to give up its reservation of a job (e.g. if it realises it
cannot complete the job).

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/release`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * Either:
    * [the node has acquired the job](permissions.md#nodeownsjob); or
    * [it thinks it has](permissions.md#nodeworkingjob)

#### Response

  * JSON object containing the [fields](#fields) of the released job.


### Start Job

Allows a node to indicate that it has begun work on a job.

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/start`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * JSON object containing:

    * send_notification: str (currently unused)

#### Permissions

  * [the node has acquired the job](permissions.md#nodeownsjob)

#### Response

  * JSON object containing the [fields](#fields) of the started job.


### Progress Job

Allows a node to update interested parties that some progress has
been made on the completion of a job.

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/progress/{PROGRESS}`

#### Parameters

  * `PK`: int (primary key of job)
  * `PROGRESS`: float (percent completed, between 0.0 and 1.0 inclusive)

#### Body

  * Any JSON object can be attached to this action, and it will be forwarded
    to any watchers of the job.

#### Permissions

  * [the node has acquired the job](permissions.md#nodeownsjob)

#### Response

  * JSON object containing the [fields](#fields) of the updated job.


### Finish Job

Allows a node to indicate that it has completed work on a job (either
successfully or in-error).

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/finish`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * JSON object containing:

    * success: bool (currently unused)
    * send_notification: str (currently unused)
    * error (optional): str (if present, the error that prevented the job from completing successfully; if absent,
                             job completed successfully)

#### Permissions

  * Either:
    * [the node has acquired the job](permissions.md#nodeownsjob); or
    * [it thinks it has](permissions.md#nodeworkingjob)

#### Response

  * JSON object containing the [fields](#fields) of the finished job.


### Reset Job

Allows a node to reset a job to its initial state so that it can be
re-attempted.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/reset`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [the node has acquired the job](permissions.md#nodeownsjob)

#### Response

  * JSON object containing the [fields](#fields) of the reset job.


### Abort Job

Allows a job to be reset to its initial state in case it is locked by
a node that has gone offline.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/abort`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the aborted job.


### Cancel Job

Allows a user to cancel a job, if they no longer require the results
of that job.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/cancel`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the cancelled job.


### Hard Delete

Permanently deletes the job. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/jobs/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted job.


### Reinstate

Undeletes a previously soft-deleted job.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated job.


### Connect To Job

The UFDL server also provides the ability to receive notifications about a job's progress via web-socket.

#### Method

`WEB SOCKET`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Permissions

  * N/A
