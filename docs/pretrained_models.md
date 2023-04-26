Manages the pre-trained models, centralizing downloads to decrease network congestion.

## Fields

  * pk: int (primary key of the pretrained model)
  * framework: JSON object (containing the [framework fields](frameworks.md#fields))
  * domain: str ([domain description](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))
  * data: bool (whether the pretrained model's data is available)
  * creator: int or null (primary key of the [user](users.md) that created the pretrained model)
  * creation_time: timestamp (the date-time that the pretrained model was created)
  * deletion_time: timestamp or null (the date-time that the pretrained model was soft-deleted, or null if still active)
  * url: str (link to the pretrained model's website)
  * description: str
  * name: str 
  * metadata: str (arbitrary additional information about the pretrained model)


# Actions

### List

Lists the pretrained models present on the server.

#### Method

`POST`

#### URL

`/v1/pretrained-models/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each pretrained model's [fields](#fields)


### Create

Creates a new pretrained model.

#### Method

`POST`

#### URL

`/v1/pretrained-models/create`

#### Body

  * framework: int (primary key of the framework that built the pretrained model)
  * domain: str ([domain name](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))
  * url: str (link to the pretrained model's website)
  * description: str
  * name: str 
  * metadata (optional): str (arbitrary additional information about the pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created pretrained model's [fields](#fields)


### Retrieve

Gets the information about a specific pretrained model.

#### Method

`GET`

#### URL

`/v1/pretrained-models/{PK}`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the pretrained model's [fields](#fields)


### Update

Updates the description of a specific pretrained model.

#### Method

`PUT`

#### URL

`/v1/pretrained-models/{PK}`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Body

  * framework: int (primary key of the framework that built the pretrained model)
  * domain: str ([domain name](domains.md#fields))
  * licence: str ([licence name](licenses.md#fields))
  * url: str (link to the pretrained model's website)
  * description: str
  * name: str 
  * metadata (optional): str (arbitrary additional information about the pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated pretrained model's [fields](#fields)


### Partial Update

Updates the description of a specific pretrained model.

#### Method

`PATCH`

#### URL

`/v1/pretrained-models/{PK}`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Body

  * framework (optional): int (primary key of the framework that built the pretrained model)
  * domain (optional): str ([domain name](domains.md#fields))
  * licence (optional): str ([licence name](licenses.md#fields))
  * url (optional): str (link to the pretrained model's website)
  * description (optional): str
  * name (optional): str 
  * metadata (optional): str (arbitrary additional information about the pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated pretrained model's [fields](#fields)


### Destroy

Flags a pretrained model as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/pretrained-models/{PK}`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)


### Set File

Sets the pretrained model's binary data.

#### Method

`POST`

#### URL

`/v1/pretrained-models/{PK}/data`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Body

  * Binary data to set as the pretrained model's file-data.

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated pretrained model's [fields](#fields)


### Delete File

Deletes the pretrained model's binary data.

#### Method

`DELETE`

#### URL

`/v1/pretrained-models/{PK}/data`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated pretrained model's [fields](#fields)


### Download

Downloads the pretrained model's binary data.

#### Method

`POST`

#### URL

`/v1/pretrained-models/{PK}/download`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Body

  * params (optional): JSON Object with string/arrays of strings as values (ignored)
  * filetype (optional): str (if present, must be "data")

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * The pretrained model's binary data (filename is set to "model.data")


### Hard Delete

Permanently deletes the pretrained model. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/pretrained-models/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted pretrained model.


### Reinstate

Undeletes a previously soft-deleted pretrained model.

#### Method

`DELETE`

#### URL

`/v1/pretrained-models/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of the pretrained model)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated pretrained model.
