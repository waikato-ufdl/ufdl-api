Speech processing is used for generating text from audio or audio from text.

# Use-cases

The following use-cases must be covered.

## Create dataset

requires: 

  * name of dataset
  * project it belongs to (optional; default is *all* project)
  * users allowed to manage it (optional; default is *only* user creating it)
  * license (default: proprietary, ie all rights reserved)
  * optional tag(s)


## Delete dataset

requires:

  * name of dataset
  

## Copy dataset

requires:

  * name of dataset
  * either:

    * new version
    * new name


## List datasets

requires:

  * filters for tags, license, ...


## List images in dataset

requires:

  * name of dataset to list


## Modify dataset

Sub use-cases:

### Add sound file

requires:

  * name of dataset to add to
  * associated transcript

### Delete sound file

Automatically removes the associated transcript.

requires:

  * name of dataset to remove from
  * name of file(s) to remove

### Set transcript

requires:

  * name of dataset to update
  * name of file(s) 
  * the transcript

### Change license

requires:

  * name of dataset to update
  * license

### Tag dataset

requires:

  * name of dataset to tag
  * tag(s)


## Download 

### Download sound file

requires:

  * name of dataset
  * name of file

### Download transcript

requires:

  * name of dataset
  * name of file

### Download dataset

Downloads the complete dataset as ZIP file.

requires:

  * name of dataset
  * format

## Other

# Notes

## Versioning

Versioning is handled in database: a dataset simply combines IDs of images

## Public datasets

Users must be able to flag a dataset as being public, i.e., being accessible
without requiring login. Can be used for research datasets.

## Dependent models

Datasets cannot be deleted if final models are in the model zoo depending on them.

