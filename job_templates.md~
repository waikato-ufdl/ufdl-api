Job templates are the backbone for getting stuff done in the UFDL framework.
From building models to generating Android apps.

# Fields

  * name
  * version
  * type (train/export/predict/evaluate/...)
  * scope (user/project/public) -- not high priority!
  * domain (classify/objdet/speech/...)
  * framework/version
  * inputs (at least one); for each input:

    * name (eg train/test/val)
    * type (eg int/float/str/dataset/model/...)
    * options (optional; eg wai.annotations conversion options)

  * parameters (zero or more); for each parameter:

    * name (eg min_width/steps/...)
    * type (eg int/float/str)
    * default (eg 1000)

  * executor_class (Python class)
  * required_packages (in pip notation, list, can be empty)
  * template (arbitrary text, interpreted by the executor class)


# Actions

## Add job template

requires:

  * name
  * version
  * type
  * scope -- not high priority!
  * domain
  * framework/version
  * inputs
  * outputs
  * parameters
  * executor_class
  * required_packages
  * template


## Update job template

partial update of any of the above fields.


## Delete job template

requires:

  * name
  * version

