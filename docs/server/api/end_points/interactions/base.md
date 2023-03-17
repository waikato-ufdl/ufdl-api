# Base Interaction Set

The set of interactions that all object-types on the UFDL server implement.

## Interactions

### List

Lists all instances of an object that the user has permission to view.

- HTTP Verb: `POST`
- URL: `/list`
- Instance or Type: Type
- Parametrisation:
  an optional [Filter Spec](../../messages/)
- Response:
  The [serialised job](../../messages/serialisations/jobs/job.md).
- Errors:
  - [Bad Model Type](../../errors/bad_model_type.md): if the object being requested is not a job.
  - [Bad Node ID](../../errors/bad_node_id.md): if the included `Node-Id` header is not valid node ID.
  - [Job Acquired](../../errors/job_acquired.md): the job has already been acquired by another node.
  - [Illegal Phase Transition](../../errors/illegal_phase_transition.md): the job has already been finalised.
