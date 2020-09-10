Projects link datasets and projects.

# Fields

Available fields:

  * name: str
  * project: [project ID](projects.md)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

# Actions

## List

POST: `/v1/core/projects/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of project)
    * name: str
    * team: [team ID](projects.md)
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp


## Load

GET: `/v1/core/projects/{PK}`

Parameters:

  * PK: int (primary key of project)
  
Response:

  * pk: int (primary key of project)
  * name: str
  * team: [team ID](projects.md)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add

POST: `/v1/core/project/create`

Body:

  * name: str
  * team: [team ID](projects.md)

Response:

  * pk: int (primary key of project)
  * name: str
  * team: [team ID](projects.md)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Update

PUT: `/v1/core/project/{PK}`

Parameters:

  * PK: int (primary key of project)
  
Body: 
 
  * name: str
  * team: [team ID](projects.md)

Response:

  * pk: int (primary key of project)
  * name: str
  * team: [team ID](projects.md)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Partial update

PATCH: `/v1/core/project/{PK}`

Parameters:

  * PK: int (primary key of project)
  
Any of the following fields in the body:
 
  * name: str
  * team: [team ID](projects.md)

Response:

  * pk: int (primary key of project)
  * name: str
  * team: [team ID](projects.md)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Delete

DELETE: `/v1/core/project/{PK}[/hard]`

Parameters:

  * PK: int (primary key of project)

Notes:

  * Omitting `/hard` from URL only flags it as deleted, it can be reinstated

## Reinstate

DELETE: `/v1/core/project/{PK}/reinstate`

Parameters:

  * PK: int (primary key of project)

Notes:

  * Undeletes a previously soft-deleted project
