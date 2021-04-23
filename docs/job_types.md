Manages the job types.

## Fields

  * pk: int (primary key of job type)
  * name: str

## Actions

### List

Lists the job types registyered with the server.

#### Method

`POST`

#### URL

`/v1/job-types/list`

#### Body (optional)
 
  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * array of

    * pk: int (primary key of job type)
    * name: str


### Create

Creates a new job type.

#### Method

`POST`

#### URL

`/v1/job-types`

#### Body

  * name: str
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * pk: int (same as `PK`)
  * name: str


### Retrieve

Gets the representation of the job type.

#### Method

`GET`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * pk: int (same as `PK`)
  * name: str


### Update

Updates the fields of the job type.

#### Method

`PUT`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)
  
#### Body

  * name: str
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * pk: int (same as `PK`)
  * name: str
  

### Partial Update

Updates a selection of fields on the job type. As job types only have a `name` field,
this is functionally equivalent to [Update](#update).

#### Method

`PATCH`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)
  
#### Body

  * name (optional): str
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * pk: int (same as `PK`)
  * name: str

### Destroy

Attempts to delete a job-type from the system. Only succeeds if no other models
are referencing the job type.

#### Method

`DELETE`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  