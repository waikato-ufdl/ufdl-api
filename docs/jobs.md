# Overview

The following types of jobs are available:

* train
* predict
* evaluate
* export

Jobs share the following common fields:

* job template
* start_time
* end_time
* error

Once a job gets submitted, a broadcast is sent via RabbitMQ to all worker nodes.
If a worker node matches (driver version, cpu/gpu memory), it can pull the job.


## Train

A train job has the additional fields:

* datasets (train/test/val)


## Predict (or pre-label)

A predict job has the additional fields:

* final_model
* dataset


## Evaluate

An evaluate job has the additional fields:

* final_model
* dataset (test)


## Export

An export job has the additional fields:

* final_model

The following types of exports may be available:

* model
* model + batch-prediction code
* Android app


## Links

* [RabbitMQ](https://www.rabbitmq.com/)
* [docker-py](https://docker-py.readthedocs.io/en/stable/)
* [docker](https://www.docker.com/)

