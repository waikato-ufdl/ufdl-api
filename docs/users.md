Manages the users of the server.

# Fields

Available fields:

  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)
  * is_staff: bool
  * is_superuser: bool
  * date_joined: timestamp
  * last_login: timestamp

# Actions

## List

POST: `/v1/users/list`

Body (optional): [filter specification](filtering.md)
  
Response:

  * array of

    * pk: int (primary key of user)
    * username: str
    * password: str
    * first_name: str
    * last_name: str
    * email: str
    * is_active: bool (active or deleted)
    * is_staff: bool
    * is_superuser: bool
    * date_joined: timestamp
    * last_login: timestamp


## Load

GET: `/v1/users/{PK}`

Parameters:

  * PK: int (primary key of user)
  
Response:

  * pk: int (primary key of user)
  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)
  * is_staff: bool
  * is_superuser: bool

## Add

POST: `/v1/users/create`

Body:

  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str

Response:

  * pk: int (primary key of user)
  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool
  * is_staff: bool
  * is_superuser: bool
  * date_joined: timestamp
  * last_login: timestamp

## Update

PUT: `/v1/users/{PK}`

Parameters:

  * PK: int (primary key of user)
  
Body: 
 
  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)

Response:

  * pk: int (primary key of user)
  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)
  * is_staff: bool
  * is_superuser: bool
  * date_joined: timestamp
  * last_login: timestamp

## Partial update

PATCH: `/v1/users/{PK}`

Parameters:

  * PK: int (primary key of user)

Any of the following fields in the body:

  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)

Response:

  * pk: int (primary key of user)
  * username: str
  * password: str
  * first_name: str
  * last_name: str
  * email: str
  * is_active: bool (active or deleted)
  * is_staff: bool
  * is_superuser: bool
  * date_joined: timestamp
  * last_login: timestamp


## Delete

DELETE: `/v1/users/{PK}`

Parameters:

  * PK: int (primary key of user)
