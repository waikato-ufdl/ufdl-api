Manages the job templates. Job-templates come in one of two varieties: workable templates and meta-templates.
Workable templates specify an `executor`, which is a Python class which implements the functionality that jobs
created from a template will perform. Meta-templates specify a graph of other templates to enact, and how to connect
the outputs from prior jobs to subsequent jobs. This allows for re-using templates to create higher-order jobs.

## Fields

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str (the name of the [domain](domains.md) that this template operates in)
  * licence: int (the primary-key of this job-template's [licence](licenses.md))
  * creator: int or null (primary key of the [user](users.md) that created the output)
  * creation_time: timestamp (the date-time that the output was created)
  * deletion_time: timestamp or null (the date-time that the output was soft-deleted, or null if still active)

If the job-template is a workable template, also included are:

  * type: str (the [contract](job_contracts.md) that this template fulfills)
  * executor_class: str (the fully-qualified path to the `executor` class for this template)
  * required_packages: str (space-separated list of packages to install to use the `executor` class)
  * parameters: JSON-object from parameter-names to objects containing:

    * types: array of str (the types of value that this parameter can take)
    * help: str (help text describing the parameter)
    * default (optional): JSON (value that is used for this parameter if no value is provided)
    * default_type (optional): str (the type of the `default` value)
    * const (optional): bool (whether the parameter value is fixed)


## Actions

### List

#### Method

`POST`

#### URL

`/v1/job-templates/list`

#### Body (optional)
 
  * [filter specification](filtering.md)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON array of objects containing each job-template's [fields](#fields)


### Retrieve

#### Method

`GET`

#### URL

`/v1/job-templates/{PK}`

#### Parameters

  * `PK`: int (primary key of job template)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)
  
#### Response

  * A JSON object containing the job-output's [fields](#fields)


### Destroy

Flags a job template as deleted, it can be [reinstated](#reinstate). To
permanently delete, see [Hard Delete](#hard-delete).

#### Method

`DELETE`

#### URL

`/v1/job-templates/{PK}`

#### Parameters

  * `PK`: int (primary key of job template)

#### Permissions

  * [user is an admin](permissions.md#isadminuser)
  

### Create Job

#### Method

`POST`

#### URL

`/v1/job-templates/{PK}/create-job`

#### Parameters

  * `PK`: int (primary key of job template)

#### Body

  * input_values: object mapping input names to objects containing:
    
    * value: JSON (the value to give the input)
    * type: str (the type to interpret the input value as)
      
  * parameter_values (optional): object mapping parameter names to objects containing:
    
    * value: JSON (the value to give the parameter)
    * type: str (the type to interpret the parameter value as)

  * description (optional): str (a free-text description of why the job was executed)
  * notification_override (optional): object containing:
    
    * actions: object containing:
      
      * on_acquire (optional): array of [notifications](notifications.md)
      * on_release (optional): array of [notifications](notifications.md)
      * on_start (optional): array of [notifications](notifications.md)
      * on_progress (optional): array of [notifications](notifications.md)
      * on_finish (optional): array of [notifications](notifications.md)
      * on_error (optional): array of [notifications](notifications.md)
      * on_reset (optional): array of [notifications](notifications.md)
      * on_abort (optional): array of [notifications](notifications.md)
      * on_cancel (optional): array of [notifications](notifications.md)
        
    * keep_default (optional): bool (true to append the given notifications to the default, or false to remove the defaults)
    
  * child_notification_overrides (optional): map of child template name to:
    
    * actions: object containing:
      
      * on_acquire (optional): array of [notifications](notifications.md)
      * on_release (optional): array of [notifications](notifications.md)
      * on_start (optional): array of [notifications](notifications.md)
      * on_progress (optional): array of [notifications](notifications.md)
      * on_finish (optional): array of [notifications](notifications.md)
      * on_error (optional): array of [notifications](notifications.md)
      * on_reset (optional): array of [notifications](notifications.md)
      * on_abort (optional): array of [notifications](notifications.md)
      * on_cancel (optional): array of [notifications](notifications.md)
        
    * keep_default (optional): bool (true to append the given notifications to the default, or false to remove the defaults)

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object containing the created job's [fields](jobs.md#fields)
  
  
### Hard Delete

Permanently deletes the job template. For soft-deletion, see [Destroy](#destroy).

#### METHOD

`DELETE`

#### URL

`/v1/job-templates/{PK}/hard`

#### Parameters

  * `PK`: int (primary key of job template)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the hard-deleted job-template's [fields](#fields)


### Reinstate

Undeletes a previously soft-deleted job template.

#### Method

`DELETE`

#### URL

`/v1/job-templates/{PK}/reinstate`

#### Parameters

  * `PK`: int (primary key of job template)

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the reinstated job-template's [fields](#fields)


### Import Template

#### Method

`POST`

#### URL

`/v1/job-templates/import`

#### Body

  * JSON representation of job template ([example](https://github.com/waikato-ufdl/ufdl-backend/blob/master/ufdl-image-classification-app/src/ufdl/image_classification_app/migrations/job_templates/0001_tensorflow_1_14_image_class_train.json))

#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * A JSON object containing the imported job-template's [fields](#fields)


### Export Template

#### Method

`GET`

#### URL

`/v1/job-templates/{PK}/export`

#### Parameters

  * `PK`: int (primary key of job template)
  
#### Permissions

  * [user is admin](permissions.md#isadminuser)

#### Response

  * JSON representation of job template ([example](https://github.com/waikato-ufdl/ufdl-backend/blob/master/ufdl-image-classification-app/src/ufdl/image_classification_app/migrations/job_templates/0001_tensorflow_1_14_image_class_train.json))


### Get All Matching Templates

Gets a list of all templates which implement a [job-contract](job_contracts.md) with inputs of specific types.

#### Method

`GET`

#### URL

`/v1/job-templates/get-all-matching-templates/{CONTRACT}?{INPUT_NAME}={INPUT_TYPE}&...`

#### Parameters

  * `CONTRACT`: int (primary key of job template)
  * `INPUT_NAME`: str (the name of an input to filter by type)
  * `INPUT_TYPE`: str (the type that the input should be able to take)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON array of objects containing all matching job-templates' [fields](#fields)


### Get All Parameters

Gets a list of the parameters to a job-template.

#### Method

`GET`

#### URL

`/v1/job-templates/{PK}/get-all-parameters`

#### Parameters

  * `PK`: int (primary key of job template)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object from the job-template's parameter names to objects containing:

    * types: object (types the parameter can take to the JSON schema for that type)
    * help: str (a description of the parameter)
    * value (optional): JSON (the default value of the parameter)
    * type (optional): str (the type of the default value)
    * schema (optional): JSON (the JSON schema for the default type)
    * const (optional): bool (whether the parameter's value is fixed)


### Get Types

Gets the type-parametrisation of a job-template's [contract](job_contracts.md).

#### Method

`GET`

#### URL

`/v1/job-templates/{PK}/get-types`

#### Parameters

  * `PK`: int (primary key of job template)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object from the job-template's generic type-parameter names to the type that the job-template
    specifies for that type-parameter.


### Get Outputs

Gets the types of a job-template's [outputs](job_outputs.md).

#### Method

`GET`

#### URL

`/v1/job-templates/{PK}/get-outputs`

#### Parameters

  * `PK`: int (primary key of job template)
  
#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * A JSON object from the job-template's [contractual](job_contracts.md) output names to the type that the job-template
    specifies for that output.
