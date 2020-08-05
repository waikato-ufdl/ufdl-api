# Overview

The following types of jobs are available (but not limited to):

* train
* predict
* evaluate
* export


# Fields

Jobs share the following common fields:

* job template PK
* start_time
* end_time
* inputs (one or more); see job templates; plus actual value
* parameters (zero or more); see job templates; plus actual value
* error

Once a job gets submitted, a broadcast is sent via RabbitMQ to all worker nodes.
If a worker node matches (driver version, cpu/gpu memory), it can pull the job.

A job template defines what inputs, outputs and parameters are available.


# Actions

## Add job

requires:

  * job template PK
  * start_time
  * end_time
  * inputs (one or more); see job templates
  * parameters (zero or more); see job templates
  * error

## Update job

partial update of any of the above fields.


## Delete job

requires:

  * job PK


# Links

* [RabbitMQ](https://www.rabbitmq.com/)

