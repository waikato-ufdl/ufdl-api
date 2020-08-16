Audio classification is used to assign categories to audio samples at certain timestamps (for a specified duration), e.g., whether the sample represents a particular song bird.

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
  * one or more annotations, for each:

    * start timestamp
    * duration
    * category

### Delete sound file

Automatically removes any associated categories.

requires:

  * name of dataset to remove from
  * name of sound file(s) to remove

### Add annotations

requires:

  * name of dataset to add to
  * name of sound(s) to add to
  * the annotations to add, for each annotation:

    * start timestamp
    * duration
    * label

### Delete annotations

requires:

  * name of dataset to remove from
  * name of sound file(s) to remove from

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
  * name of sound file

### Download annotations

requires:

  * name of dataset
  * annotation format

### Download dataset

Downloads the complete dataset as ZIP file.

requires:

  * name of dataset
  * annotation format

