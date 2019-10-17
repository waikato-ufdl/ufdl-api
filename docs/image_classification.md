[Image classification](https://en.wikipedia.org/wiki/Computer_vision#Recognition) 
is used to assign categories to images, e.g., whether the image represents an animal
or a face.

# Use-cases

The following use-cases must be covered.

## Create dataset

requires: 

  * name of dataset
  * project it belongs to (optional; default is *all* project)
  * users allowed to manage it (optional; default is *only* user creating it)


## Delete dataset

requires:

  * name of dataset


## Modify dataset

Sub use-cases:

### Add image

requires:

  * name of dataset to add to
  * image categories

### Delete image

Automatically removes any associated categories.

requires:

  * name of dataset to remove from
  * name of image(s) to remove

### Add categories

requires:

  * name of dataset to add to
  * name of image(s) to add to
  * the categories to add

### Delete categories

requires:

  * name of dataset to remove from
  * name of image(s) to remove from


## Download 

### Download image

requires:

  * name of dataset
  * name of image

### Download categories

requires:

  * name of dataset
  * annotation format

### Download dataset

Downloads the complete dataset as ZIP file.

requires:

  * name of dataset
  * annotation format

## Other

### Bulk upload

Uploads a complete dataset as ZIP file. Replaces any existing images
with the same names and their associated categories.

To be used when annotating data with third-party tools.

requires:

  * name of dataset
  * annotation format


# Notes

## Versioning

How to do versioning? Simple copy?

## Category formats

The following annotation formats need to be supported:

  * simple JSON: key (= name of image) with associated array of categories
  * ADAMS ??

## Public datasets

Users must be able to flag a dataset as being public, i.e., being accessible
without requiring login. Can be used for research datasets.

## Dependent models

Datasets cannot be deleted if final models are in the model zoo depending on them.
