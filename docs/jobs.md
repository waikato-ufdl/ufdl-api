# Overview

The following types of jobs are available (but not limited to):

* train
* predict
* evaluate
* export

Jobs share the following common fields:

* job template PK
* start_time
* end_time
* error

Once a job gets submitted, a broadcast is sent via RabbitMQ to all worker nodes.
If a worker node matches (driver version, cpu/gpu memory), it can pull the job.

A job template defines what inputs, outputs and parameters are available.


## Links

* [RabbitMQ](https://www.rabbitmq.com/)

