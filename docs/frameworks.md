Centralized table with frameworks and their versions (e.g., PyTorch 1.2).

# Fields

Available fields:

  * name: str
  * version: str

# Actions

## List

POST: `/v1/frameworks/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of framework)
    * name: str
    * version: str


## Load

GET: `/v1/frameworks/{PK}`

Parameters:

  * PK: int (primary key of framework)
  
Response:

  * pk: int (primary key of framework)
  * name: str
  * version: str

## Add

POST: `/v1/frameworks/create`

Body:

  * name: str
  * version: str

Response:

  * pk: int (primary key of framework)
  * name: str
  * version: str

## Update

PUT: `/v1/frameworks/{PK}`

Parameters:

  * PK: int (primary key of framework)
  
Body: 
 
  * name: str
  * version: str

Response:

  * pk: int (primary key of framework)
  * name: str
  * version: str

## Partial update

PATCH: `/v1/frameworks/{PK}`

Parameters:

  * PK: int (primary key of framework)

Any of the following fields in the body:

  * name: str
  * version: str

Response:

  * pk: int (primary key of framework)
  * name: str
  * version: str


## Delete

DELETE: `/v1/frameworks/{PK}`

Parameters:

  * PK: int (primary key of framework)
