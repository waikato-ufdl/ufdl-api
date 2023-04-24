Teams combine users and their permissions.

Permissions (each permission level includes all previous permission levels):
  
  * R - read
  * X - job execute
  * W - write
  * A - admin


## Fields

Available fields:

  * pk: int
  * name: str
  * members: array of

    * pk: int
    * username: str
    
  * creator: int or null (primary key of the [user](users.md) that created the team)
  * creation_time: timestamp (the date-time that the team was created)
  * deletion_time: timestamp or null (the date-time that the team was soft-deleted, or null if still active)


## Actions

### List

Lists the teams present on the server.

#### Method

`POST`

#### URL

`/v1/teams/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each team's [fields](#fields)


### Create

Creates a new team.

#### Method

`POST`

#### URL

`/v1/teams/create`

#### Body

  * name: str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created team's [fields](#fields)


### Retrieve

Gets the information about a specific team.

#### Method

`GET`

#### URL

`/v1/teams/{PK}`

#### Parameters

  * `PK`: int (primary key of team)

#### Permissions

  * [user is a member of the team](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the team's [fields](#fields)


### Update

Updates a specific team.

#### Method

`PUT`

#### URL

`/v1/teams/{PK}`

#### Parameters

  * `PK`: int (primary key of team)

#### Body

  * name: str

#### Permissions

  * [user is an admin member](permissions.md#memberhasadminpermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated team's [fields](#fields)


### Partial Update

Updates a specific team.

#### Method

`PATCH`

#### URL

`/v1/teams/{PK}`

#### Parameters

  * `PK`: int (primary key of team)

#### Body

  * name (optional): str

#### Permissions

  * [user is an admin member](permissions.md#memberhasadminpermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated team's [fields](#fields)


### Destroy

Flags a team as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/teams/{PK}`

#### Parameters

  * `PK`: int (primary key of team)

#### Permissions

  * [user is an admin member](permissions.md#memberhasadminpermission), or
  * [user is admin](permissions.md#isadminuser)


### Modify Memberships

Updates the membership status of a user within the team.

#### Method

`PATCH`

#### URL

`/v1/teams/{PK}/memberships`

#### Parameters

  * `PK`: int (primary key of team)

#### Body

  * username: str (the user to modify membership for)
  * method: str (the type of modification to make, one of "add", "remove" or "update")
  * permissions (optional, default is "R"): str (the permission level to give the user, one of "R", "X", "W", "A", for read, execute, write, admin respectively)

#### Permissions

  * [user is an admin member](permissions.md#memberhasadminpermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * user: int (the primary key of the user whose membership was modified)
  * team: int (the primary key of the team)
  * permissions: str (the permission level of the team member)
  * creator: int or null (primary key of the [user](users.md) that created the membership)
  * creation_time: timestamp (the date-time that the membership was created)
  * deletion_time: timestamp or null (the date-time that the membership was soft-deleted, or null if still active)


### Get Permissions For User

Gets the permission status of a member of a team.

#### Method

`GET`

#### URL

`/v1/teams/{PK}/permissions/{USERNAME}`

#### Parameters

  * `PK`: int (primary key of team)
  * `USERNAME`: str (the username for which to query permission status)

#### Permissions

  * [user is an admin member](permissions.md#memberhasadminpermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  The permission string for the user (one of "R", "X", "W", "A")  


### Hard Delete

Permanently deletes the team. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/teams/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of team)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted team.


### Reinstate

Undeletes a previously soft-deleted team.

#### Method

`DELETE`

#### URL

`/v1/teams/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of team)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated team.
