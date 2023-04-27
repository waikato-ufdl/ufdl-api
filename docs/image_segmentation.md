Additional image segmentation dataset operations.

For core dataset operations, see [here](datasets.md).

**NB:** labels = layer names

## URL

Uses `/v1/segments/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

## Actions

### Get Layer

Gets the segmentation mask image for a label in a dataset.

#### Method

`GET`

#### URL

`/v1/segments/datasets/{PK}/layers/{FILENAME}/{LABEL}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (the filename of the image to get the layer from)
  * `LABEL`: str (the label of the layer to get)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  Binary image data for the layer mask.
  

### Set Layer

Sets the segmentation mask image for a label in a dataset.

#### Method

`POST`

#### URL

`/v1/segments/datasets/{PK}/layers/{FILENAME}/{LABEL}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (the filename of the image to get the layer from)
  * `LABEL`: str (the label of the layer to get)

#### Body

  Binary image data for the layer mask.

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  JSON string containing the label.
  

### Get Labels

Gets the labels used by a dataset.

#### Method

`GET`

#### URL

`/v1/segments/datasets/{PK}/labels`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON array of strings containing the labels.


### Set Labels

Gets the labels used by a dataset.

#### Method

`POST`

#### URL

`/v1/segments/datasets/{PK}/labels`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * labels: array of str

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  A JSON array of strings containing the labels.

  
