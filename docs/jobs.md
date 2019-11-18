# Overview

![Overview](img/overview.svg)

## Build request

* (docker) image ID (specific AI framework, libraries and version)
* dataset ID
* pretrained model id
* model parameters

## Build job

* build ID
* (docker) image ID (specific AI framework, libraries and version)
* dataset ID
* model ID (for storing outcomes/errors)
* pretrained model id
* model parameters
* job flow

## Slave X

* GPU server
* arbitrary number of slaves can subscribe to job queue
* can be brought online any time

## Links

* [RabbitMQ](https://www.rabbitmq.com/)
* [docker-py](https://docker-py.readthedocs.io/en/stable/)
* [docker](https://www.docker.com/)

# Job flows

* simple operators to define job in detail
* operators can be named, may have options
* operations may have incoming ports and/or outgoing ports
* operator examples

  * Job: outgoing (all job details as ports)
  * LoadDataset: incoming (dataset id), outgoing (dataset)
  * BuildModel: incoming (dataset, pretrained model id, model params), outgoing (model)
  * BuildApp: incoming (model), outgoing (app)
  * EvaluateModel: incoming (model, test dataset), outgoing (eval results, key-value-pairs)
  * StoreModel: incoming (model)
  * StoreEvaluation: incoming (eval results)
  * Email: incoming (anything, sends [model|app|evaluation] ID as link)

* job execution errors are automatically stored in Model repo by flow executor
* definition language: [Common Workflow Language](https://en.wikipedia.org/wiki/Common_Workflow_Language)?
* GUI editor: [Rabix Composer](https://github.com/rabix/composer)?

