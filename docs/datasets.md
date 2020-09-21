Core dataset operations.

# Fields

Available fields:

  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

# Actions

## List

POST: `/v1/datasets/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * name: str
    * description: str
    * version: int
    * project: [project ID](projects.md)
    * licence: [license ID](licenses.md)
    * tags: str
    * is_public: bool
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp

## Load

GET: `/v1/datasets/{PK}`

Parameters:

  * PK: int (primary key of dataset)
  
Response:

  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add

POST: `/v1/datasets/create`

Body:

  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool

Response:

  * pk: int (primary key of dataset)
  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Update

PUT: `/v1/datasets/{PK}`

Parameters:

  * PK: int (primary key of dataset)
  
Body: 
 
  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool

Response:

  * pk: int (primary key of dataset)
  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Partial update

PATCH: `/v1/datasets/{PK}`

Parameters:

  * PK: int (primary key of dataset)

Any of the following fields in the body:

  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool

Response:

  * pk: int (primary key of dataset)
  * name: str
  * description: str
  * version: int
  * project: [project ID](projects.md)
  * licence: [license ID](licenses.md)
  * tags: str
  * is_public: bool
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp


## Delete

DELETE: `/v1/datasets/{PK}[/hard]`

Parameters:

  * PK: int (primary key of dataset)

Notes:

  * Omitting `/hard` from URL only flags it as deleted, it can be reinstated

## Reinstate

DELETE: `/v1/datasets/{PK}/reinstate`

Parameters:

  * PK: int (primary key of dataset)

Notes:

  * Undeletes a previously soft-deleted dataset

## Copy

POST: `/v1/datasets/{PK}/copy`

Parameters:

  * PK: int (primary key of dataset)
  
Body:

  * new_name: str  

## Merge

POST: `/v1/datasets/{PK}/merge/{SOURCE_PK}`

Parameters:

  * PK: int (primary key of dataset)
  * SOURCE_PK: int (primary key of the dataset to merge into PK)
  
Body:

  * delete: bool
  * hard: bool (optional, default: false)  

## Add file

POST: `/v1/datasets/{PK}/files/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (the name of the file to use in the dataset)
  
Byte array attachment is the binary content of the file.

## Get file

GET: `/v1/datasets/{PK}/files/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (the name of the file to use in the dataset)

Returned byte array is the binary content of the file. 

## Delete file

DELETE: `/v1/datasets/{PK}/files/{NAME}`

Parameters: 

  * PK: the primary key of the dataset
  * NAME: the name of the file to delete

## Set meta-data

POST: `/v1/datasets/{PK}/metadata/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (the name of the file in the dataset)

Body:

  * metadata: str (free form text meta-data)  

## Get meta-data (for file)

GET: `/v1/datasets/{PK}/metadata/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (the name of the file in the dataset)

Returned string is the meta-data for the file.  

## Get meta-data (for dataset)

GET: `/v1/datasets/{PK}/metadata`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (the name of the file in the dataset)

Returns JSON with filename - meta-data string association.  
