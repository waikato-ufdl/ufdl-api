Additional speech dataset operations.

For core dataset operations, see [here](datasets.md).

# Fields

  * files: array of file names
  * transcriptions: for each image name a transcription (nested object, transcription field)

# URL

Uses `/v1/core/speech/` instead of `/v1/core/datasets/`, 
also for the core operations.

# Actions

## Add transcript

POST: `/v1/core/speech/{PK}/transcriptions/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (name of file to set the transcript for)

Body:

  * transcription: str

## Get transcripts

GET: `/v1/core/speech/{PK}/transcriptions`

Parameters:

  * PK: int (primary key of dataset)

Response:

  * for each image name the corresponding transcript (nested object, transcription field)
