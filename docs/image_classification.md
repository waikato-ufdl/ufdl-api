Additional image classification dataset operations.

For core dataset operations, see [here](datasets.md).

# URL

Uses `/v1/classify/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

# Actions

## Add categories

PATCH: `/v1/classify/datasets/{PK}/categories`

Parameters:

  * PK: int (primary key of dataset)

Body:

  * method: "add"
  * images: array of image names
  * categories: array of category strings to add to all specified images

## Get categories

GET: `/v1/classify/datasets/{PK}/categories`

Parameters:

  * PK: int (primary key of dataset)

Response:

  * for each image name an array of category strings

## Remove categories

PATCH: `/v1/classify/datasets/{PK}/categories`

Parameters:

  * PK: int (primary key of dataset)

Body:

  * method: "remove"
  * images: array of image names
  * categories: array of category strings to remove from all specified images
