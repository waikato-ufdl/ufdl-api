# Interactions

Interactions are the types of operations that a user can request to perform on an [object](../objects/index.md)
resident on the server. All objects implement the [base set](base.md) of interactions, and may also opt in to
other sets of interactions as appropriate. Therefore, a set of interactions may be thought of as an interface that
a type of object may implement.

As all additional interactions beyond the [base set](base.md) must be represented as opt-in, some additional sets of
interactions are purely for use with a single type of object, to extend only its capabilities in a non-reusable way.
These interactions usually contain the name of the object for which they are intended in their own name.

Each interaction set lists the object-types that implement it, along with the end-points that the set provides, with
the following information:

- HTTP Verb: The HTTP verb used to perform the interaction (GET, POST, etc.).
- URL: the tail of the URL that is used to perform the interaction.
- Instance or Type:
  whether the interaction works on a particular instance of the object being interacted with, or on the set of all
  instances.
- Parametrisation:
  how the request can be parametrised.
- Response:
  The type of response a successful request will produce.
- Errors:
  Any errors that may be produced by the request in lieu of a normal response.

## List of Interaction Sets

- [Acquire Job](acquire_job.md): TODO
- [Add Job Output](add_job_output.md): TODO
- [Clear Dataset](clear_dataset.md): TODO
- [Copyable](copyable.md): TODO
- [Create Job](create_job.md): TODO
- [Downloadable](downloadable.md): TODO
- [File Container](file_container.md): TODO
- [Get All Matching Templates](get_all_matching_templates.md): TODO
- [Get All Values Of Type](get_all_values_of_type.md): TODO
- [Get By Name](get_by_name.md): TODO
- [Get Hardware Generation](get_hardware_generation.md): TODO
- [Import Template](import_template.md): TODO
- [Licence Sub-descriptor](licence_subdescriptor.md): TODO
- [Membership](membership.md): TODO
- [Merge](merge.md): TODO
- [Ping](ping.md): TODO
- [Set File](set_file.md): TODO
- [Soft Delete](soft_delete.md): TODO
