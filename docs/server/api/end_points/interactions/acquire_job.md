# Acquire Job Interaction Set

A set of interactions which allows worker-nodes to mark jobs as "acquired", so that multiple nodes don't try to
perform the same job, and to update the server on the progression state of the job.

## Implementors

- [Job](../objects/jobs/job.md)

## Interactions

### Acquire Job

Marks a job as acquired by a particular worker-node.

- HTTP Verb: `GET`
- URL: `/acquire`
- Instance or Type: Instance
- Parametrisation:
  include the Node ID of the acquiring node in the `Node-Id` request header.
- Response:
  The [serialised job](../../messages/serialisations/jobs/job.md).
- Errors:
  - [Bad Model Type](../../errors/bad_model_type.md): if the object being requested is not a job.
  - [Bad Node ID](../../errors/bad_node_id.md): if the included `Node-Id` header is not valid node ID.
  - [Job Acquired](../../errors/job_acquired.md): the job has already been acquired by another node.
  - [Illegal Phase Transition](../../errors/illegal_phase_transition.md): the job has already been finalised.

### Release Job

TODO

### Start Job

TODO

### Progress Job

TODO

### Finish Job

TODO

### Reset Job

TODO

### Abort Job

TODO

### Cancel Job

TODO
