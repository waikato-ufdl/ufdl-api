[Object detection](https://en.wikipedia.org/wiki/Object_detection) or 
[object co-segmentation](https://en.wikipedia.org/wiki/Object_Co-segmentation)
is used for detecting specific types of objects in images. For this to work, 
images need to be annotated with the relevant regions highlighted. The regions 
can either be simple bounding boxes or polygons that align to the shape of the 
objects.

# Use-cases

The following use-cases must be covered 

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

### Add annotations

Automatically replaces any existing annotations for an image.

requires:

  * name of dataset to add to
  * name of image to add to

### Delete image

Automatically removes any associated annotations.

requires:

  * name of dataset to remove from
  * name of image to remove

### Delete annotations

requires:

  * name of dataset to remove from

### Replace annotations

See *Add annotations*.


## Download 

### Download image

requires:

  * name of dataset
  * name of image

### Download annotations

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
with the same names and their associated annotations.

To be used when annotating data with third-party tools like ADAMS.

requires:

  * name of dataset
  * type of annotations

### Pre-label images

Upload images as ZIP file and submits a job for labeling them.

requires:

  * annotation format
  * name of model to use for pre-labeling
  * either:

    * send email with annotations for images
    * add images and their annotations to existing dataset (requires dataset name then)


# Notes

## Annotation formats

The following annotation formats need to be supported:

  * ADAMS reports

    * simple [Java properties](https://en.wikipedia.org/wiki/.properties) files
    * extension `.report`
    * annotation format: `Object.XYZ.{y|y|width|height|poly_x|poly_y}` (`poly_x` and 
      `poly_y` are only used for object shapes; the numeric `XYZ` index ties the 
      various properties for an object together)

  * [MS COCO JSON](http://cocodataset.org/#format-data)

