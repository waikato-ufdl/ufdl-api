Centralized table with frameworks and their versions (e.g., PyTorch 1.2).

## Fields

  * name: str
  * version: str

## Actions

### List

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

#### Method

`DELETE`

#### URL

`/v1/frameworks/{PK}`

#### Parameters

  * `PK`: int (primary key of framework)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
