Centralized table with domains. Domains are automatically added to 
the database, depending on the available modules in the backend.

# Fields

Available fields:

  * name: str (od)
  * description: str (Object detection)

# Actions

## List

POST: `/v1/core/domains/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of domain)
    * name: str
    * description: str


## Load

GET: `/v1/core/domains/{PK}`

Parameters:

  * PK: int (primary key of domain)
  
Response:

  * pk: int (primary key of domain)
  * name: str
  * description: str
