Notifications are actions taken when a [job](jobs.md) transitions from one phase to another through-out its lifecycle.
The phase-transitions that can occur during a job's lifecycle (and thus can trigger notifications) are:

  * Acquisition: a worker node has reserved the job for exclusive access
  * Release: the worker node has released the job, as it cannot perform it (due to missing requirements, e.g. hardware)
  * Start: the worker node has checked that it can perform the job, and has started to do so
  * Progression: the worker node has made some progress toward completing the job
  * Finish: the worker node has successfully completed the job
  * Error: the worker node has encountered a problem while trying to complete the job
  * Reset: the worker node has voluntarily reset the job to its initial state
           (occurs when a worker-node crashes, comes back online, and has lost the work-state needed to continue the job)
  * Abortion: an admin user has forcefully reset the job to its initial state
              (used to unlock jobs from crashed worker-nodes)
  * Cancellation: a user has determined that the job is no longer required

## Notification Data

A packet of notification data is given to each notification type, to be used to add job-specific information to the
notification. See the [Notification Types section](#notification-types) for how this information is added to each type
of notification. The data provided is:

  * transition: str (the transition that occurred)
  * description: str (the `description` [field of the job](jobs.md#fields) that transitioned)
  * pk: int (the primary-key of the [job](jobs.md) that transitioned)
  * progress: float (the current progress amount of the [job](jobs.md) that transitioned)
  * cancelled: bool (whether the [job](jobs.md) that transitioned has been cancelled)
  * node (optional): int (the primary-key of the [node](nodes.md) that has acquired the job, if any)
  * error (optional): str (the error that stopped the [job](jobs.md), if any)
  * transition_data: JSON object (arbitrary data supplied during a `progress` transition, empty for all other transitions)

## Notification Types

The server currently supports specification of 3 types of notification. These are defined when
[creating a job from a job-template](job_templates.md#create-job). Named replacement-fields below refers to a part of a
string which is replaced with data from the [notification data](#notification-data) provided to the notification. It
appears as the name of a [notification data](#notification-data) field enclosed in `{}` e.g. `"Hello from job #{pk}"`
would have the sub-string `"{pk}"` substituted with the `pk` value from the notification data, to become e.g.
`"Hello from job #1"`.

### Print Notification

Prints a message to the log output of the server.

  * JSON object containing:

    * message: str (can contain named replacement fields)
  
### Email Notification

Sends an email to a recipient.

  * JSON object containing:

    * subject: str (can contain named replacement fields, except for `transition_data`)
    * body: str (can contain named replacement fields)
    * to: array of str
    * cc: array of str
    * bcc: array of str
  
### Websocket Notification

To specify a web-socket notification, use an empty JSON object. Clients listening to the job (via
[Connect To Job](jobs.md#connect-to-job)) will receive the [notification data](#notification-data), as JSON via the
connected websocket, for transitions that have this notification type specified.
