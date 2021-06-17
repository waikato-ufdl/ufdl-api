Additional image segmentation dataset operations.

For core dataset operations, see [here](datasets.md).

**NB:** labels = layer names

# URL

Uses `/v1/segments/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

# Actions

## Set labels

Must be invoked after creating a new dataset to allow the upload of layer masks.

POST: `/v1/segments/datasets/{PK}/labels`

Parameters:

  * PK: int (primary key of dataset)

Body:

  * labels: array of labels

## Get labels

GET: `/v1/segments/datasets/{PK}/labels`

Parameters:

  * PK: int (primary key of dataset)

Response:

  * array of labels

## Set layer

Uploads a layer mask for an image.

POST: `/v1/segments/datasets/{PK}/layers/{image}/{label}`

Parameters:

  * PK: int (primary key of dataset)
  * image: the name of the image to upload the mask for
  * label: the name of the layer

Body:

  * the layer mask as file attachment

## Get layer

Downloads a layer mask of an image (may not exist).

GET: `/v1/segments/datasets/{PK}/layers/{image}/{label}`

Parameters:

  * PK: int (primary key of dataset)
  * image: the name of the image to upload the mask for
  * label: the name of the layer

Response:

  * byte array representing the mask file (0-length if layer not present)
