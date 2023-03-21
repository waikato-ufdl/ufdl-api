Manages the job types. Job-types are Python classes that know how to serialise/deserialise/specify values
to a job's inputs/outputs/parameters. The information kept by the server is meta-data about where to find
those classes.

## Fields

  * pk: int (primary key of job type)
  * name: str (the name used to refer to the type on the server)
  * pkg: str (the Python package exporting the job-type's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-type as exported from `pkg`)

## Actions

### List

Lists the job types registered with the server.

#### Method

`POST`

#### URL

`/v1/job-types/list`

#### Body (optional)
 
  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON array of objects containing each job-type's [fields](#fields)


### Create

Creates a new job type.

#### Method

`POST`

#### URL

`/v1/job-types`

#### Body

  * name: str (the name used to refer to the type on the server)
  * pkg: str (the Python package exporting the job-type's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-type as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the newly-created job-type's [fields](#fields)


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

  * A JSON object containing the job-type's [fields](#fields)


### Update

Updates the fields of the job type.

#### Method

`PUT`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)
  
#### Body

  * name: str (the name used to refer to the type on the server)
  * pkg: str (the Python package exporting the job-type's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-type as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the updated job-type's [fields](#fields)
  

### Partial Update

Updates a selection of fields on the job type.

#### Method

`PATCH`

#### URL

`/v1/job-types/{PK}`

#### Parameters

  * `PK`: int (primary key of job type)
  
#### Body

  * name (optional): str (the name used to refer to the type on the server)
  * pkg (optional): str (the Python package exporting the job-type's class definition)
  * cls (optional): str (the fully-qualified path to the class which implements the job-type as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the updated job-type's [fields](#fields)


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


### Get All Values Of Type

Gets all values of a server-resident job-type held by the server.

#### Method

`GET`

#### URL

`/v1/job-types/get-all-values/{TYPE}`

#### Parameters

  * `TYPE`: str (the server-resident type to get values of)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * array of JSON-representations of resident objects, exact fields depends on `TYPE`.
