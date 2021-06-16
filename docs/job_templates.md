Manages the job templates.

## Fields

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * licence: [licence](licenses.md)
  * domain: [domain](domains.md)
  * inputs: set of [inputs](inputs.md)
  * parameters: set of [parameters](parameters.md)
  * creator: [user](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * workabletemplate: [workable template](workable_templates.md) or null
  * metatemplate: [meta-template](meta_templates.md) or null 

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

array of

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str ([domain name](domains.md))
  * inputs (array of):
      
    * name: str
    * types: array of str
    * options: str
    * help: str
        
  * parameters (array of):
      
    * name: str
    * type: str
    * default: str
    * help: str
        
  * licence: [licence ID](licenses.md)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * framework (optional): [framework ID](frameworks.md)
  * type (optional): str
  * executor_class (optional): str
  * required_packages (optional): str
  * body (optional): str

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

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str ([domain name](domains.md))
  * inputs (array of):
    
    * name: str
    * types: array of str
    * options: str
    * help: str
    
  * parameters (array of):
    
    * name: str
    * type: str
    * default: str
    * help: str
    
  * licence: [licence ID](licenses.md)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * framework (optional): [framework ID](frameworks.md)
  * type (optional): str
  * executor_class (optional): str
  * required_packages (optional): str
  * body (optional): str

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

  * input_values (map from input name to):
    
    * value: str
    * type: str
      
  * parameter_values (optional): map from parameter name to str
  * description (optional): str
  * notification_override (object):
    
    * actions (object):
      
      * on_acquire: array of [notifications](notifications.md)
      * on_release: array of [notifications](notifications.md)
      * on_start: array of [notifications](notifications.md)
      * on_progress: array of [notifications](notifications.md)
      * on_finish: array of [notifications](notifications.md)
      * on_error: array of [notifications](notifications.md)
      * on_reset: array of [notifications](notifications.md)
      * on_abort: array of [notifications](notifications.md)
      * on_cancel: array of [notifications](notifications.md)
        
    * keep_default (optional): bool
    
  * child_notification_overrides (map of child template name to):
    
    * actions (object):
      
      * on_acquire: array of [notifications](notifications.md)
      * on_release: array of [notifications](notifications.md)
      * on_start: array of [notifications](notifications.md)
      * on_progress: array of [notifications](notifications.md)
      * on_finish: array of [notifications](notifications.md)
      * on_error: array of [notifications](notifications.md)
      * on_reset: array of [notifications](notifications.md)
      * on_abort: array of [notifications](notifications.md)
      * on_cancel: array of [notifications](notifications.md)
        
    * keep_default (optional): bool

#### Permissions

  * [user is authenticated](permissions.md#isauthenticated)

#### Response

  * pk: [job ID](jobs.md)
  * description: str
  * template (object):
    
    * pk: int (same as `PK`)
    * name: str
    * version: int
    
  * input_values (map of input name to):
    
    * value: str
    * type: str
    
  * parameter_values: null or map of parameter name to str
  * outputs (array of objects):
    
    * pk: [job output ID](job_outputs.md)
    * name: str
    * type: str
    
  * node: [node ID](nodes.md) or null
  * error_reason: str or null
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * start_time: timestamp or null
  * end_time: timestamp or null
  * parent: int (primary key of parent job) or null
  * is_cancelled: bool
  
  
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

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str ([domain name](domains.md))
  * inputs: array of:
    * name: str
    * types: array of str
    * options: str
    * help: str
  * parameters: array of:
    * name: str
    * type: str
    * default: str
    * help: str
  * licence: [licence ID](licenses.md)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * framework (optional): [framework ID](frameworks.md)
  * type (optional): str
  * executor_class (optional): str
  * required_packages (optional): str
  * body (optional): str


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

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str ([domain name](domains.md))
  * inputs: array of:
    * name: str
    * types: array of str
    * options: str
    * help: str
  * parameters: array of:
    * name: str
    * type: str
    * default: str
    * help: str
  * licence: [licence ID](licenses.md)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * framework (optional): [framework ID](frameworks.md)
  * type (optional): str
  * executor_class (optional): str
  * required_packages (optional): str
  * body (optional): str


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

  * pk: int (primary key of job template)
  * name: str
  * version: int
  * description: str
  * scope: str (public/project/user)
  * domain: str ([domain name](domains.md))
  * inputs: array of:
    * name: str
    * types: array of str
    * options: str
    * help: str
  * parameters: array of:
    * name: str
    * type: str
    * default: str
    * help: str
  * licence: [licence ID](licenses.md)
  * creator: [user ID](users.md) or null
  * creation_time: timestamp
  * deletion_time: timestamp or null
  * framework (optional): [framework ID](frameworks.md)
  * type (optional): str
  * executor_class (optional): str
  * required_packages (optional): str
  * body (optional): str


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
