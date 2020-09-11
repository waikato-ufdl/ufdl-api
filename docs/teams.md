Teams combine users and their permissions.

# Fields

Available fields:

  * name: str
  * members: array of (pk: int, username: str)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

Permissions:
  
  * R - read
  * W - write
  * X - job execute
  * A - admin

# Actions

## List

POST: `/v1/teams/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of team)
    * name: str
    * members: array of (pk: int, username: str)
    * creator: [user ID](users.md)
    * creation_time: timestamp
    * deletion_time: timestamp


## Load

GET: `/v1/teams/{PK}`

Parameters:

  * PK: int (primary key of team)
  
Response:

  * pk: int (primary key of team)
  * name: str
  * members: array of (pk: int, username: str)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Add

POST: `/v1/team/create`

Body:

  * name: str

Response:

  * pk: int (primary key of team)
  * name: str
  * members: array of (pk: int, username: str)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Update

PUT: `/v1/team/{PK}`

Parameters:

  * PK: int (primary key of team)
  
Body: 
 
  * name: str

Response:

  * pk: int (primary key of team)
  * name: str
  * members: array of (pk: int, username: str)
  * creator: [user ID](users.md)
  * creation_time: timestamp
  * deletion_time: timestamp

## Modify membership

PATCH: `/v1/team/{PK}/memberships`

Parameters:

  * PK: int (primary key of team)

Body:

  * method: str (add/remove/remove)
  * username: str
  * permissions: str (R/W/X/A, only add/update)


## Delete

DELETE: `/v1/team/{PK}[/hard]`

Parameters:

  * PK: int (primary key of team)

Notes:

  * Omitting `/hard` from URL only flags it as deleted, it can be reinstated

## Reinstate

DELETE: `/v1/team/{PK}/reinstate`

Parameters:

  * PK: int (primary key of team)

Notes:

  * Undeletes a previously soft-deleted team
