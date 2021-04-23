Manages the workable job templates.

## Fields

  * pk: int (primary key of meta-template)
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
  * child_relations: set of [meta-template child relations](meta_template_child_relations.md)

## Actions

### None
