Gives access to the available licenses on the server.

## Fields

  * pk: int
  * name: str
  * url: str
  * domains: array of str (Software/Models/Data)
  * permissions: array of str
  * limitations: array of str
  * conditions: array of str

## Actions

### List

Lists the licences present on the server.

#### Method

`POST`

#### URL

`/v1/licences/list`
`/v1/licenses/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each licence's [fields](#fields)


### Create

Creates a new licence.

#### Method

`POST`

#### URL

`/v1/licences/create`
`/v1/licenses/create`

#### Body

  * name: str
  * url: str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the newly-created licence's [fields](#fields)



### Retrieve

Gets the information about a specific licence.

#### Method

`GET`

#### URL

`/v1/licences/{PK}`
`/v1/licenses/{PK}`

#### Parameters

  * `PK`: int (primary key of the licence)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the licence's [fields](#fields)


### Update

Updates a specific licence.

#### Method

`PUT`

#### URL

`/v1/licences/{PK}`
`/v1/licenses/{PK}`

#### Parameters

  * `PK`: int (primary key of licence)

#### Body

  * name: str
  * url: str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated licence's [fields](#fields)


### Partial Update

Updates a specific licence.

#### Method

`PATCH`

#### URL

`/v1/licences/{PK}`
`/v1/licenses/{PK}`

#### Parameters

  * `PK`: int (primary key of the licence)

#### Body

  * name (optional): str
  * url (optional): str

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated licence's [fields](#fields)


### Destroy

Deletes a licence from the server.

#### Method

`DELETE`

#### URL

`/v1/licences/{PK}`
`/v1/licenses/{PK}`

#### Parameters

  * `PK`: int (primary key of the licence)

#### Permissions

  * [user is admin](permissions.md#isadminuser)


### Modify Subdescriptors

Modifies the domains, permissions, limitations and conditions of a licence.

#### Method

`PATCH`

#### URL

`/v1/licences/{PK}/subdescriptors`
`/v1/licenses/{PK}/subdescriptors`

#### Parameters

  * `PK`: int (primary key of the licence)

#### Body

  * type: str (one of: "domains", "permissions", "limitations", "conditions")
  * method: str (one of: "add", "remove")
  * names: array of str (the `type` sub-descriptors to add to/remove from the licence)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the updated licence's [fields](#fields)
