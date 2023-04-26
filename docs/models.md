Manages models.

## Fields

  * pk: int (primary key of the model)
  * framework: JSON object (containing the [framework fields](frameworks.md#fields))
  * domain: str ([domain description](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))
  * data: bool (whether the model's data is available)
  * creator: int or null (primary key of the [user](users.md) that created the model)
  * creation_time: timestamp (the date-time that the model was created)
  * deletion_time: timestamp or null (the date-time that the model was soft-deleted, or null if still active)


## Actions

### List

Lists the models present on the server.

#### Method

`POST`

#### URL

`/v1/models/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each model's [fields](#fields)


### Create

Creates a new model.

#### Method

`POST`

#### URL

`/v1/models/create`

#### Body

  * framework: int (primary key of the framework that built the model)
  * domain: str ([domain name](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created model's [fields](#fields)



### Retrieve

Gets the information about a specific model.

#### Method

`GET`

#### URL

`/v1/models/{PK}`

#### Parameters

  * `PK`: int (primary key of model)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the model's [fields](#fields)


### Update

Updates the description of a specific model.

#### Method

`PUT`

#### URL

`/v1/models/{PK}`

#### Parameters

  * `PK`: int (primary key of model)

#### Body

  * framework: int (primary key of the framework that built the model)
  * domain: str ([domain name](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated model's [fields](#fields)


### Partial Update

Updates the description of a specific model.

#### Method

`PATCH`

#### URL

`/v1/models/{PK}`

#### Parameters

  * `PK`: int (primary key of model)

#### Body

  * framework (optional): int (primary key of the framework that built the model)
  * domain (optional): str ([domain name](domains.md#fields))
  * licence (optional): str ([licence name](licenses.md#fields))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated model's [fields](#fields)


### Destroy

Flags a model as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/models/{PK}`

#### Parameters

  * `PK`: int (primary key of model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)


### Set File

Sets the model's binary data.

#### Method

`POST`

#### URL

`/v1/models/{PK}/data`

#### Parameters

  * `PK`: int (primary key of model)

#### Body

  * Binary data to set as the model's file-data.

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated model's [fields](#fields)


### Delete File

Deletes the model's binary data.

#### Method

`DELETE`

#### URL

`/v1/models/{PK}/data`

#### Parameters

  * `PK`: int (primary key of model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated model's [fields](#fields)


### Download

Downloads the model's binary data.

#### Method

`POST`

#### URL

`/v1/models/{PK}/download`

#### Parameters

  * `PK`: int (primary key of model)

#### Body

  * params (optional): JSON Object with string/arrays of strings as values (ignored)
  * filetype (optional): str (if present, must be "data")

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * The model's binary data (filename is set to "model.data")


### Hard Delete

Permanently deletes the model. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/models/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted model.


### Reinstate

Undeletes a previously soft-deleted model.

#### Method

`DELETE`

#### URL

`/v1/models/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated model.
