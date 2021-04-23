Manages the relationship between a meta-template and its child templates.

# Fields

  * pk: int (primary key of the relation)
  * parent: [meta-template](meta_templates.md)
  * child: [job template](job_templates.md)
  * name: str
  * dependents: set of [meta-template dependencies](meta_template_dependencies.md)
  * dependencies: set of [meta-template dependencies](meta_template_dependencies.md)

# Actions

None
