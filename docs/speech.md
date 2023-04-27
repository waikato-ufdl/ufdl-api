Additional speech dataset operations.

For core dataset operations, see [here](datasets.md).

## URL

Uses `/v1/speech/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

## Actions

### Get Transcriptions

Gets the transcriptions for each audio file in a dataset.

#### Method

`GET`

#### URL

`/v1/speech/datasets/{PK}/transcriptions`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON object from filename to:

  * transcription: str
  

### Get Transcription For File

Gets the transcription for an audio file in a dataset.

#### Method

`GET`

#### URL

`/v1/speech/datasets/{PK}/transcriptions/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  * transcription (optional): str (absent if file has no transcription)
  

### Set Transcription For File

Sets the transcription for an audio file in a dataset.

#### Method

`POST`

#### URL

`/v1/speech/datasets/{PK}/transcriptions/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the file)

#### Body

  * transcription (optional): str (clears the transcription if absent)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  * transcription (optional): str (same as body)
