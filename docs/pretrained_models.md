Manages the pre-trained models, centralizing downloads to decrease network congestion.

# Fields

Available fields:

  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

# Actions

## List

POST: `/v1/pretrained-models/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of pretrained-model)
    * name: str
    * framework: [framework ID](frameworks.md)
    * domain: [domain name](domains.md)
    * licence: [license ID](licenses.md)
    * url: str
    * description: str
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp


## Load

GET: `/v1/pretrained-models/{PK}`

Parameters:

  * PK: int (primary key of pretrained-model)
  
Response:

  * pk: int (primary key of pretrained-model)
  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add

POST: `/v1/pretrained-models/create`

Body:

  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str

Response:

  * pk: int (primary key of pretrained-model)
  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Update

PUT: `/v1/pretrained-models/{PK}`

Parameters:

  * PK: int (primary key of pretrained-model)
  
Body: 
 
  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str

Response:

  * pk: int (primary key of pretrained-model)
  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Partial update

PATCH: `/v1/pretrained-models/{PK}`

Parameters:

  * PK: int (primary key of pretrained-model)

Any of the following fields in the body:

  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str

Response:

  * pk: int (primary key of pretrained-model)
  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp


## Delete

DELETE: `/v1/pretrained-models/{PK}`

Parameters:

  * PK: int (primary key of pretrained-model)
