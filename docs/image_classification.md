Additional image classification dataset operations.

For core dataset operations, see [here](datasets.md).

## URL

Uses `/v1/classify/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

## Actions

### Get Categories

Gets the categories for each image in a dataset.

#### Method

`GET`

#### URL

`/v1/classify/datasets/{PK}/categories`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON object from filename to an array of categories for the file.
  

### Get Categories For File

Gets the categories for an image in a dataset.

#### Method

`GET`

#### URL

`/v1/classify/datasets/{PK}/categories/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (name of the new file)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON array of categories for the file.
  

### Modify Categories

Modifies the categories for images in a dataset.

#### Method

`PATCH`

#### URL

`/v1/classify/datasets/{PK}/categories`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  * method: str (either "add" or "remove")
  * images: array of str (the filenames of images to modify categories for)
  * categories: array of str (the categories to either add or remove from the images)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  A JSON object from filename to the categories added to/removed from the file.


### Set Categories

Sets the categories for images in a dataset.

#### Method

`POST`

#### URL

`/v1/classify/datasets/{PK}/categories`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  A JSON object from filename to an array of categories for the file.

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  A JSON object from filename to an array of categories for the file.

  
