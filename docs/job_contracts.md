Manages the job contracts. Job-contracts are a specification of a generic interface that a job-template can fulfill.
This allows the server to group/search [job-templates](job_templates.md) that perform similar functions. A contract can
be parametrised by a set of types, and specifies which inputs a job-template must take (including their types), and
which outputs it must produce (again, including type), to meet the contract. The types of the inputs/outputs
can be specified generically, so a job-template can say that it fulfills a contract _in relation to_ the 
type-parametrisation of the contract.

E.g. A _training_ contract which trains a model on a dataset:

```
contract Train<Domain, Framework> {
    execute(dataset: PK<Dataset<Domain>>) -> Model<Domain, Framework>;
}
```

This contract specifies how job-templates that are designed to train models should appear. A job-template can train a
model in a _particular domain_, using a _particular framework_, and in order to do so, must be passed the primary-key
of a dataset _in the given domain_, and must produce a model _for the given domain/framework_. Job-templates which meet
this contract can also take in additional parameters, and produce additional outputs, but this contract specifies the
minimum requirements necessary to qualify the job-template as _training a model_.

Similar to [job-types](job_types.md), job-contracts are specified as Python classes. The information kept by the server
is meta-data about where to find the Python class that defines the contract.


## Fields

  * pk: int (primary key of job contract)
  * name: str (the name used to refer to the contract on the server)
  * pkg: str (the Python package exporting the job-contract's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-contract as exported from `pkg`)

## Actions

### List

Lists the job contracts registered with the server.

#### Method

`POST`

#### URL

`/v1/job-contracts/list`

#### Body (optional)
 
  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON array of objects containing each job-contract's [fields](#fields)


### Create

Creates a new job contract.

#### Method

`POST`

#### URL

`/v1/job-contracts`

#### Body

  * name: str (the name used to refer to the contract on the server)
  * pkg: str (the Python package exporting the job-contract's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-contract as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the newly-created job-contract's [fields](#fields)


### Retrieve

Gets the representation of a job contract.

#### Method

`GET`

#### URL

`/v1/job-contracts/{PK}`

#### Parameters

  * `PK`: int (primary key of job contract)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON object containing the job-contract's [fields](#fields)


### Update

Updates the fields of the job contract.

#### Method

`PUT`

#### URL

`/v1/job-contracts/{PK}`

#### Parameters

  * `PK`: int (primary key of job contract)
  
#### Body

  * name: str (the name used to refer to the contract on the server)
  * pkg: str (the Python package exporting the job-contract's class definition)
  * cls: str (the fully-qualified path to the class which implements the job-contract as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the updated job-contract's [fields](#fields)
  

### Partial Update

Updates a selection of fields on the job contract.

#### Method

`PATCH`

#### URL

`/v1/job-contracts/{PK}`

#### Parameters

  * `PK`: int (primary key of job contract)
  
#### Body

  * name (optional): str (the name used to refer to the contract on the server)
  * pkg (optional): str (the Python package exporting the job-contract's class definition)
  * cls (optional): str (the fully-qualified path to the class which implements the job-contract as exported from `pkg`)
  
#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  
#### Response

  * A JSON object containing the updated job-contract's [fields](#fields)


### Destroy

Attempts to delete a job-contract from the system. Only succeeds if no other models
are referencing the job contract.

#### Method

`DELETE`

#### URL

`/v1/job-contracts/{PK}`

#### Parameters

  * `PK`: int (primary key of job contract)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
