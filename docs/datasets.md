Core dataset operations.

## Fields

  * pk: int
  * name: str
  * description: str
  * version: int
  * previous_version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp
  * files (object): 
    
    * file name (str): cache ID (str)

## Actions

### List

Lists the datasets present on the server.

#### Method

`POST`

#### URL

`/v1/datasets/list`

#### Permissions

  * [none required](permissions.md#allowany)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each dataset's [fields](#fields)


### Create

Creates a new dataset.

#### Method

`POST`

#### URL

`/v1/datasets/create`

#### Body

  * name: str
  * description: str
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool

#### Permissions

  * [user has write permission for the team the dataset is being created for](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created dataset's [fields](#fields)


### Retrieve

Gets the information about a specific dataset.

#### Method

`GET`

#### URL

`/v1/datasets/{PK}`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [the dataset is public](permissions.md#ispublic), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the dataset's [fields](#fields)


### Update

Updates a specific dataset.

#### Method

`PUT`

#### URL

`/v1/datasets/{PK}`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * name: str
  * description: str
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * A JSON object containing the updated dataset's [fields](#fields)


### Partial Update

Updates a specific dataset.

#### Method

`PATCH`

#### URL

`/v1/datasets/{PK}`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * name (optional): str
  * description (optional): str
  * project (optional): [project ID](projects.md)
  * licence (optional): [license ID](licenses.md)
  * tags (optional): str
  * is_public (optional): bool

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * A JSON object containing the updated dataset's [fields](#fields)


### Destroy

Flags a dataset as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/datasets/{PK}`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user has write permission for the team the dataset is being created for](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser)


### Clear Dataset

Removes all meta-data and annotations from a dataset.

#### Method

`DELETE`

#### URL

`/v1/datasets/{PK}/clear`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * A JSON object containing the cleared dataset's [fields](#fields)


### Merge

Merges the files from a source dataset into a target dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/merge/{OTHER}`

#### Parameters

  * `PK`: int (primary key of the target dataset)
  * `OTHER`: int (primary key of the source dataset)

#### Body

  * delete: bool (whether to delete the source dataset after the merge)
  * hard (optional): bool (whether to hard-delete, ignored if `delete` is `false`, default is false)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * A JSON object containing the target dataset's [fields](#fields)


### Download

Downloads a dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/download`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * params (optional): JSON Object (must be empty if supplied, ignored)
  * filetype (optional): str (one of "zip" or "tar.gz", defaults to "zip")

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * The dataset as an archive, containing the files in the dataset.


### Copy

Creates a copy of a dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/copy`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * new_name (optional): str (creates a new dataset if supplied, or a new version of the source dataset if not)
  * only_files (optional): array of str (the files to include in the copy, or all files if omitted)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created dataset's [fields](#fields)


### Add File

Adds a file to a dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/files/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the new file)

#### Body

  File binary data.

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * filename: str
  * handle: str (handle to the file's data on the server)


### Add Files

Adds files to a dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/files-multi`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  Binary data of a zip archive containing the files to add.

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * array of:

    * filename: str
    * handle: str (handle to the file's data on the server)


### Get File

Gets a file from a dataset.

#### Method

`GET`

#### URL

`/v1/datasets/{PK}/files/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  File binary data.


### Delete File

Deletes a file from the dataset.

#### Method

`DELETE`

#### URL

`/v1/datasets/{PK}/files/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * filename: str
  * handle: str (handle to the file's data on the server)


### Set Metadata

Sets the metadata for a file in a dataset.

#### Method

`POST`

#### URL

`/v1/datasets/{PK}/metadata/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Body

  * metadata: str

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)

#### Response

  * metadata: str


### Get Metadata

Gets the metadata for a file in a dataset.

#### Method

`GET`

#### URL

`/v1/datasets/{PK}/metadata/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  * metadata: str


### Get All Metadata

Gets the metadata for all files in a dataset.

#### Method

`GET`

#### URL

`/v1/datasets/{PK}/metadata`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)

#### Response

  JSON object from filename to metadata


### Hard Delete

Permanently deletes a dataset. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/datasets/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the hard-deleted dataset.


### Reinstate

Undeletes a previously soft-deleted dataset.

#### Method

`DELETE`

#### URL

`/v1/datasets/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON object containing the [fields](#fields) of the reinstated dataset.
