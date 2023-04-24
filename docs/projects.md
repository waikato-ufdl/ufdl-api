Projects are for organising groups of datasets within a team.

# Fields

## Fields

Available fields:

  * pk: int
  * name: str
  * team: int (primary key of the team that owns the project)
  * creator: int or null (primary key of the [user](users.md) that created the project)
  * creation_time: timestamp (the date-time that the project was created)
  * deletion_time: timestamp or null (the date-time that the project was soft-deleted, or null if still active)


## Actions

### List

Lists the projects present on the server.

#### Method

`POST`

#### URL

`/v1/projects/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each project's [fields](#fields)


### Create

Creates a new project.

#### Method

`POST`

#### URL

`/v1/projects/create`

#### Body

  * name: str
  * team: int (primary key of the team to create the project for)

#### Permissions

  * [user is a member of the project's team with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created project's [fields](#fields)


### Retrieve

Gets the information about a specific project.

#### Method

`GET`

#### URL

`/v1/projects/{PK}`

#### Parameters

  * `PK`: int (primary key of project)

#### Permissions

  * [user is a member of the project's team](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the project's [fields](#fields)


### Update

Updates a specific project.

#### Method

`PUT`

#### URL

`/v1/projects/{PK}`

#### Parameters

  * `PK`: int (primary key of project)

#### Body

  * name: str
  * team: int (primary key of the team to move the project to)

#### Permissions

  * [user is a member of the project's team with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated project's [fields](#fields)


### Partial Update

Updates a specific project.

#### Method

`PATCH`

#### URL

`/v1/projects/{PK}`

#### Parameters

  * `PK`: int (primary key of project)

#### Body

  * name (optional): str
  * team (optional): int (primary key of the team to move the project to)

#### Permissions

  * [user is a member of the project's team with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated project's [fields](#fields)


### Destroy

Flags a project as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/projects/{PK}`

#### Parameters

  * `PK`: int (primary key of project)

#### Permissions

  * [user is a member of the project's team with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)


### Hard Delete

Permanently deletes the project. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/projects/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of project)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted project.


### Reinstate

Undeletes a previously soft-deleted project.

#### Method

`DELETE`

#### URL

`/v1/projects/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of project)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated project.
