Contains information about the registered worker nodes.

Some actions require the user performing the action to be acting on behalf of a node. This is indicated by
including the `Node-Id` header in the request headers, set to the primary-key of the node.


# Fields

Available fields:

  * pk: int
  * ip: str (IP address of the node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware primary-key](hardware.md#fields) or null
  * gpu_mem: int or null (in bytes, null if no GPU on node)
  * last seen: timestamp or null
  * current_job: [job primary-key](jobs.md#fields) or null

# Actions

### List

Lists the nodes present on the server.

#### Method

`POST`

#### URL

`/v1/nodes/list`

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Body (optional)

  * [filter specification](filtering.md)
  
#### Response

  * A JSON array of objects containing each node's [fields](#fields)


### Create

Creates a new node.

#### Method

`POST`

#### URL

`/v1/nodes/create`

#### Body

  * ip: str (IP address of the node)
  * index: int (GPU index, 0 for CPU-only nodes)
  * cpu_mem: int (in bytes)
  * driver_version: str
  * hardware_generation: [hardware primary-key](hardware.md#fields) or null
  * gpu_mem: int or null (in bytes, null if no GPU on node)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the newly-created node's [fields](#fields)


### Retrieve

Gets the information about a specific node.

#### Method

`GET`

#### URL

`/v1/nodes/{PK}`

#### Parameters

  * `PK`: int (primary key of the node)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the node's [fields](#fields)


### Update

Updates a specific node.

#### Method

`PUT`

#### URL

`/v1/nodes/{PK}`

#### Parameters

  * `PK`: int (primary key of node)

#### Body

  * JSON object containing:

    * ip: str (IP address of the node)
    * index: int (GPU index, 0 for CPU-only nodes)
    * cpu_mem: int (in bytes)
    * driver_version: str
    * hardware_generation: [hardware primary-key](hardware.md#fields) or null
    * gpu_mem: int or null (in bytes, null if no GPU on node)

#### Permissions

  * [user is admin](permissions.md#isadminuser), or
  * [node is self](permissions.md#nodeisself)

#### Response

  * A JSON object containing the updated node's [fields](#fields)


### Partial Update

Updates a specific node.

#### Method

`PATCH`

#### URL

`/v1/nodes/{PK}`

#### Parameters

  * `PK`: int (primary key of the node)

#### Body

  * JSON object containing:

    * ip (optional): str (IP address of the node)
    * index (optional): int (GPU index, 0 for CPU-only nodes)
    * cpu_mem (optional): int (in bytes)
    * driver_version (optional): str
    * hardware_generation (optional): [hardware primary-key](hardware.md#fields) or null
    * gpu_mem (optional): int or null (in bytes, null if no GPU on node)

#### Permissions

  * [user is admin](permissions.md#isadminuser), or
  * [node is self](permissions.md#nodeisself)

#### Response

  * A JSON object containing the updated node's [fields](#fields)


### Destroy

Deletes a node from the server.

#### Method

`DELETE`

#### URL

`/v1/nodes/{PK}`

#### Parameters

  * `PK`: int (primary key of the node)

#### Permissions

  * [user is admin](permissions.md#isadminuser), or
  * [node is self](permissions.md#nodeisself)


### Ping

#### Method

`GET`

#### URL

`/v1/nodes/ping`

#### Permissions

  * [user is admin](permissions.md#isadminuser), or
  * [user is node](permissions.md#isnode)

**Note:** Just simple no-op to reestablish connection after long-running tasks.