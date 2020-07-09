Docker plays a central part in UFDL, not just for training models, but also
for exporting them and generating other output.

# Fields

* name
* url (full URL used for a `docker pull`)
* registry_url (the URL of the registry)
* registry_user (only necessary if not anonymous access)
* registry_password (dito)
* cuda_version (the required cuda version to run this image)
* min_hardware (Pascal=1080Ti, Turing=2080Ti)
* framework_name
* framework_version
* domain (objdet/classify/speech/...)
* types (train/predict/export/evaluate/...)

# Actions

## Add docker image

requires:

  * name
  * url
  * registry_url
  * registry_user
  * registry_password
  * cuda_version
  * min_hardware
  * framework_name
  * framework_version
  * domain
  * types

## Update docker image

partial update of any of these fields:

  * name
  * url
  * registry_url
  * registry_user
  * registry_password
  * cuda_version
  * min_hardware
  * framework_name
  * framework_version
  * domain
  * types


## Delete docker image

requires:

  * name
  * version


## Links

* [docker](https://www.docker.com/)
* [aml-repo](https://aml-repo.cms.waikato.ac.nz/)

