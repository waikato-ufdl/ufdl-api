Gives access to the available licenses on the server.

# Fields

Available fields:

  * name: str
  * url: str
  * domains: str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

# Actions

## List

POST: `/v1/core/licences/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of license)
    * name: str
    * url: str
    * domains: str (Software/Models/Data)
    * permissions: array of str
    * limitations: array of str
    * conditions: array of str


## Load

GET: `/v1/core/licences/{PK}`

Parameters:

  * PK: int (primary key of license)
  
Response:

  * pk: int (primary key of license)
  * name: str
  * url: str
  * domains: str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

## Add

POST: `/v1/core/licences/create`

Body:

  * name: str
  * url: str

Response:

  * pk: int (primary key of license)
  * name: str
  * url: str
  * domains: str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

## Update

PUT: `/v1/core/licences/{PK}`

Parameters:

  * PK: int (primary key of license)
  
Body: 
 
  * name: str
  * url: str

Response:

  * pk: int (primary key of license)
  * name: str
  * url: str
  * domains: str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

## Partial update

PATCH: `/v1/core/licences/{PK}`

Parameters:

  * PK: int (primary key of license)

Any of the following fields in the body:

  * name: str
  * url: str

Response:

  * pk: int (primary key of license)
  * name: str
  * url: str
  * domains: str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

## Modify domains/permissions/limitations/conditions

PATCH: `/v1/core/licences/{PK}/subdescriptors`

Parameters:

  * PK: int (primary key of license)
  
Body:

  * method: str (add/remove)
  * type: str (domains/permissions/limitations/conditions)
  * names: array of str


## Delete

DELETE: `/v1/core/licences/{PK}`

Parameters:

  * PK: int (primary key of license)
