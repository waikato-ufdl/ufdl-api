Manages the workable job templates.

# Fields

  * pk: int (primary key of workable job template)
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
  * framework: [framework](frameworks.md)
  * type: [job type](job_types.md)
  * executor_class: str
  * required_packages: str
  * body: str

# Actions

None
