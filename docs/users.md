Manages the users of the server.

## Fields

  * pk: int
  * username: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)
  * is_staff: bool
  * is_superuser: bool
  * date_joined: timestamp
  * last_login: timestamp


## Actions

### List

Lists the users present on the server.

#### Method

`POST`

#### URL

`/v1/users/list`

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each user's [fields](#fields)


### Create

Creates a new user.

#### Method

`POST`

#### URL

`/v1/users/create`

#### Body

  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active (optional): bool (active or deleted, default is true/active)
  * is_staff (optional): bool (default is false)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created user's [fields](#fields)


### Retrieve

Gets the information about a specific user.

#### Method

`GET`

#### URL

`/v1/users/{PK}`

#### Parameters

  * `PK`: int (primary key of user)

#### Permissions

  * [user is retrieving self](permissions.md#isself), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the user's [fields](#fields)


### Update

Updates a specific user.

#### Method

`PUT`

#### URL

`/v1/users/{PK}`

#### Parameters

  * `PK`: int (primary key of user)

#### Body

  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active (optional): bool (active or deleted, default is true/active)
  * is_staff (optional): bool (default is false)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated user's [fields](#fields)


### Partial Update

Updates a specific user.

#### Method

`PATCH`

#### URL

`/v1/users/{PK}`

#### Parameters

  * `PK`: int (primary key of user)

#### Body

  * username (optional): str
  * password (optional): str
  * first_name (optional): str
  * last_name (optional): str
  * email (optional): str
  * is_active (optional): bool (active or deleted, default is true/active)
  * is_staff (optional): bool (default is false)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated user's [fields](#fields)


### Destroy

Marks a user as inactive.

#### Method

`DELETE`

#### URL

`/v1/users/{PK}`

#### Parameters

  * `PK`: int (primary key of user)

#### Permissions

  * [user is admin](permissions.md#isadminuser)


### Get By Name

Gets a user by username.

#### METHOD

`GET`

#### URL

`/v1/users/{NAME}`

#### Parameters

  * `NAME`: str (username of the user to retrieve)

#### Permissions

  * [user is retrieving self](permissions.md#isself), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the user.
