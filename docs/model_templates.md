Each deeplearning framework comes with its own configuration file format.
In order to start training on a dataset with a pre-trained model, we need
to customize configuration templates.
Users also need to be able to supply their own, tweaked templates.

# Configuration template

A template contains the following information:

  * template name
  * framework (eg tensorflow 2.x)
  * model name (Faster RCNN ResNet 101)
  * license
  * version
  * config 
  
    * the raw configuration template with placeholders
    * based on original framework config file
    * simply stored as string between triple quotes

  * parameters; each parameter:

    * name (eg img_min_dim)
    * required (true|false)
    * placeholder in config (${IMG_MIN_DIM})
    * default value (for optional parameters)


# Actions

## Add template

requires:

  * template name
  * framework
  * model name
  * version
  * config
  * parameters


## Delete template

requires:

  * template name
  * framework
  * model name
  * version


## Download template

requires:

  * template name
  * framework
  * model name
  * version


## Search

parameters:

  * framework
  * model name
  * license
  * version
  * ...


## Public templates

Users must be able to flag a templates as being public, i.e., being accessible
without requiring login.


