Manages the pre-trained models, centralizing downloads to decrease network congestion.

# Fields

Available fields:

  * name: str
  * framework: [framework ID](frameworks.md)
  * domain: [domain name](domains.md)
  * licence: [license ID](licenses.md)
  * url: str
  * description: str

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


## Delete

DELETE: `/v1/pretrained-models/{PK}`

Parameters:

  * PK: int (primary key of pretrained-model)
