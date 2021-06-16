Manages the generated jobs.

## Fields

  * pk: int (primary key of job)
  * description: str
  * template: [job template ID](job_templates.md)
  * input_values: str
  * parameter_values: str or null
  * outputs: array of [job outputs](job_outputs.md)
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * progress_amount: float


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

  * array of

    * pk: int (primary key of job)
    * description: str
    * template (object):
      
      * pk: [job template ID](job_templates.md)
      * name: str
      * version: int
        
    * input_values (object):
      
      * (input name) -> { value: str, type: str }
        
    * parameter_values (object or null):
      
      * (parameter name) -> string
        
    * outputs (array of objects):
      
      * pk: [job output ID](job_outputs.md)
      * name: str
      * type: str
        
    * node: [node ID](nodes.md) or null
    * error_reason: str or null
    * creator: [user ID](users.md) or null
    * creation_time: timestamp
    * deletion_time: timestamp or null
    * start_time: timestamp or null
    * end_time: timestamp or null
    * parent: int (primary key of parent job) or null
    * is_cancelled: bool

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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


### Update

Updates the description of a specific job.

#### Method

`PUT`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * description: str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


### Partial Update

Updates the description of a specific job.

#### Method

`PATCH`

#### URL

`/v1/jobs/{PK}`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * description (optional): str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: [job output ID](job_outputs.md)
  * job: job ID (same as the `PK` parameter)
  * name: str (same as the `NAME` parameter) 
  * type: str (same as the `TYPE` parameter)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null


### Delete Output

Removes an output from a job.

#### Method

`DELETE`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}`

#### Parameters

  * PK: the primary key of the job
  * NAME: the name of the output to delete
  * TYPE: the type of the output to delete

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * pk: [job output ID](job_outputs.md)
  * job: job ID (same as the `PK` parameter)
  * name: str (same as the `NAME` parameter)
  * type: str (same as the `TYPE` parameter)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null


### Get Output

Downloads the output data of a job output.

#### Method

`GET`

#### URL

`/v1/jobs/{PK}/outputs/{NAME}/{TYPE}`

#### Parameters

  * PK: the primary key of the job
  * NAME: the name of the output to retrieve
  * TYPE: the type of the output to retrieve

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

  * PK: the primary key of the job
  * NAME: the name of the output to delete
  * TYPE: the type of the output to delete

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * pk: [job output ID](job_outputs.md)
  * job: job ID (same as the `PK` parameter)
  * name: str (same as the `NAME` parameter)
  * type: str (same as the `TYPE` parameter)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


### Start Job

Allows a node to indicate that it has begun work on completing a job.

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/start`

#### Parameters

  * `PK`: int (primary key of job)

#### Body

  * send_notification: str (currently unused)

#### Permissions

  * [the node has acquired the job](permissions.md#nodeownsjob)

#### Response

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


### Progress Job

Allows a node to update interested parties that some progress has
been made on the completion of a job.

#### Method

`POST`

#### URL

`/v1/jobs/{PK}/progress/{PROGRESS}`

#### Parameters

  * `PK`: int (primary key of job)
  * `PROGRESS`: float between 0.0 and 1.0

#### Body

  * Any JSON object can be attached to this action, and it will be forwarded
    to any watchers of the job.

#### Permissions

  * [the node has acquired the job](permissions.md#nodeownsjob)

#### Response

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * success: bool (currently unused)
  * send_notification: str (currently unused)
  * error (optional): str

#### Permissions

  * Either:
    * [the node has acquired the job](permissions.md#nodeownsjob); or
    * [it thinks it has](permissions.md#nodeworkingjob)

#### Response

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool


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

  * pk: int (primary key of job)
  * description: str
  * template (object):
    
    * pk: [job template ID](job_templates.md)
    * name: str
    * version: int
    
  * input_values (object):
    
    * (input name) -> { value: str, type: str }
    
  * parameter_values (object or null):
    
    * (parameter name) -> string
    
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool
