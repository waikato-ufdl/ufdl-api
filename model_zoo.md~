In order to perform transfer learning and build models on data, it is necessary 
to have pre-trained models readily available for the training process.
Therefore we require two types of model storage:

* pre-trained models
* final models

# Pre-trained models

## Add model

requires:

  * model name
  * version
  * format
  * model file or URL to upload
  * [license](license_overview.md)
  * origin URL
  * data domain(s) (classify/objdet/speech/...)
  * public?
  * meta-data

    * description (input nodes, dimensions, etc)
    * ...

## Delete model

Automatically deletes the meta-data.

Cannot be deleted if a final model depends on it.

requires:

  * model name
  * version
  * format

## Download model

requires:

  * model name
  * format
  * version


## Search

parameters:

  * data domain
  * [license or permissions/limitations/conditions](license_overview.md)
  * ...


# Final models

## Add model

requires:

  * model name
  * version
  * format
  * model file or URL to upload
  * pre-trained model ID it was built on top of
  * dataset ID it was trained with
  * [license](license_overview.md)
  * data domain(s) (classify/objdet/speech/...)
  * public?
  * meta-data

    * description (input nodes, dimensions, etc)
    * results on validation/test datasets
    * ...

## Delete model

Automatically deletes the meta-data.

requires:

  * model name
  * version
  * format

## Download model

requires:

  * model name
  * format
  * version


# Notes


## Format conversions

Automatic model conversion into different formats ([MMdnn](https://github.com/Microsoft/MMdnn))?


## Public models

Users must be able to flag a models (pre-trained or train) as being public, 
i.e., being accessible without requiring login.


