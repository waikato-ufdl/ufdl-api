Centralized table with domains. Domains are automatically added to 
the database, depending on the available modules in the backend.

## Fields

  * pk: int
  * name: str (2-letter short-code for the domain e.g. "od")
  * description: str (Long-format name for the domain e.g. "Object Detection")

## Actions

### List

Lists the domains present on the server.

#### Method

`POST`

#### URL

`/v1/domains/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each domain's [fields](#fields)


### Retrieve

Gets the information about a specific domain.

#### Method

`GET`

#### URL

`/v1/domains/{PK}`

#### Parameters

  * `PK`: int (primary key of the domain)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the domain's [fields](#fields)
