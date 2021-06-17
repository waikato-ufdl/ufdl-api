Additional speech dataset operations.

For core dataset operations, see [here](datasets.md).

# URL

Uses `/v1/speech/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

# Actions

## Add transcript

POST: `/v1/speech/datasets/{PK}/transcriptions/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (name of file to set the transcript for)

Body:

  * transcription: str

## Get transcripts

GET: `/v1/speech/datasets/{PK}/transcriptions`

Parameters:

  * PK: int (primary key of dataset)

Response:

  * for each image name the corresponding transcript (nested object, transcription field)
