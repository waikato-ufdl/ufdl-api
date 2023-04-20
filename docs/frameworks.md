Centralized table with frameworks and their versions (e.g., PyTorch 1.2).

## Fields

  * pk: int
  * name: str
  * version: str

## Actions

### List

Lists the frameworks registered with the server.

#### Method

`POST`

#### URL

`/v1/frameworks/list`

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * array of

    * pk: int (primary key of framework)
    * name: str
    * version: str


### Create

Adds a new framework to the server.

#### Method

`POST`

#### URL

`/v1/frameworks/create`

#### Body

  * name: str
  * version: str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of framework)
  * name: str
  * version: str


### Retrieve

Gets the information about a framework.

#### Method

`GET`

#### URL

`/v1/frameworks/{PK}`

#### Parameters

  * `PK`: int (primary key of framework)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * pk: int (primary key of framework)
  * name: str
  * version: str


### Update

Modifies the details of a framework.

#### Method

`PUT`

#### URL

`/v1/frameworks/{PK}`

#### Parameters

  * `PK`: int (primary key of framework)
  
#### Body
 
  * name: str
  * version: str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of framework)
  * name: str
  * version: str


### Partial update

Modifies a subset of the details of a framework.

#### Method

`PATCH`

#### URL

`/v1/frameworks/{PK}`

#### Parameters

  * `PK`: int (primary key of framework)

#### Body

  * name (optional): str
  * version (optional): str

#### Permissions

  * [user is an admin](permissions.md#isadminuser)

#### Response

  * pk: int (primary key of framework)
  * name: str
  * version: str


### Destroy

Removes a framework from the server.

#### Method

`DELETE`

#### URL

`/v1/frameworks/{PK}`

#### Parameters

  * `PK`: int (primary key of framework)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
