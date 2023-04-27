Additional object detection dataset operations.

For core dataset operations, see [here](datasets.md).

## Fields

Annotation objects:

  * x: int
  * y: int
  * width: int
  * height: int
  * label: str
  * polygon (optional): polygon object
  * prefix (optional): str (defaults to "Object" if absent)
  * time (optional): float (timestamp of the object in a video, absent for image files)

Polygon objects:

  * points: array of array with two int values (x, y) (e.g. `[[x0, y0], [x1, y1], ...]`)

## URL

Uses `/v1/objdet/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

## Actions

### Get Annotations

Gets the annotated objects for each image/video in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/annotations`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON object from filename to:

  * length (optional): float (length of the video file, absent for image files)
  * annotations: array of [annotation objects](#fields)
  

### Set Annotations

Sets the annotated objects for each image/video in a dataset.

#### Method

`POST`

#### URL

`/v1/objdet/datasets/{PK}/annotations`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  A JSON object from filename to:

  * length (optional): float (length of the video file, absent for image files)
  * annotations: array of [annotation objects](#fields)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.
  

### Clear Annotations

Removes all annotated objects from each image/video in a dataset.

#### Method

`DELETE`

#### URL

`/v1/objdet/datasets/{PK}/annotations`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Get Annotations For File

Gets the annotated objects for an image/video in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/annotations/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (image/video to get annotations for)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON array of [annotation objects](#fields)

  
### Add Annotations To File

Appends additional annotated objects to an image/video in a dataset.

#### Method

`PATCH`

#### URL

`/v1/objdet/datasets/{PK}/annotations/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (image/video to add annotations to)

#### Body

  A JSON array of [annotation objects](#fields)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Set Annotations For File

Sets the annotated objects for an image/video in a dataset.

#### Method

`POST`

#### URL

`/v1/objdet/datasets/{PK}/annotations/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (image/video to set annotations for)

#### Body

  A JSON array of [annotation objects](#fields)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Delete Annotations For File

Removes all annotated objects from an image/video in a dataset.

#### Method

`DELETE`

#### URL

`/v1/objdet/datasets/{PK}/annotations/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (image/video to set annotations for)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Get Labels

Gets the labels of all annotated objects in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/labels`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON array of strings (the unique labels in alphabetical order)


### Add Labels

Adds labels to a dataset.

#### Method

`POST`

#### URL

`/v1/objdet/datasets/{PK}/labels`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  A JSON array of strings (the labels to add)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Delete Label

Removes a label from a dataset.

#### Method

`DELETE`

#### URL

`/v1/objdet/datasets/{PK}/labels/{LABEL}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `LABEL`: str (the label to remove)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Get Prefixes

Gets the prefixes of all annotated objects in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/prefixes`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON array of strings (the unique prefixes in alphabetical order)


### Add Prefixes

Adds prefixes to a dataset.

#### Method

`POST`

#### URL

`/v1/objdet/datasets/{PK}/prefixes`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Body

  A JSON array of strings (the prefixes to add)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Delete Prefix

Removes a prefix from a dataset.

#### Method

`DELETE`

#### URL

`/v1/objdet/datasets/{PK}/prefixes/{PREFIX}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `PREFIX`: str (the prefix to remove)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Get File Type

Gets the file-type metadata for a file in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/file-type/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (file to get file-type for)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  * format (optional): str (the file format)
  * dimensions (optional): array of 2 ints (the `[width, height]` of the image/video) 
  * length (optional): float (video length in seconds, absent for images)


### Set File Type

Sets the file-type metadata for a file in a dataset.

#### Method

`POST`

#### URL

`/v1/objdet/datasets/{PK}/file-type/{FILENAME}`

#### Parameters

  * `PK`: int (primary key of the dataset)
  * `FILENAME`: str (file to set file-type for)

#### Body

  * format (optional): str (the file format)
  * dimensions (optional): array of 2 ints (the `[width, height]` of the image/video) 
  * length (optional): float (video length in seconds, absent for images)

#### Permissions

  * [user is a member of the team that owns the dataset with write permission](permissions.md#memberhaswritepermission), or
  * [user is admin](permissions.md#isadminuser), or
  * both:
    * [user is a member of the team that owns the dataset with execute permission](permissions.md#memberhasexecutepermission), and
    * [user is a node](permissions.md#isnode)
  
#### Response

  Empty JSON object.


### Get File Types

Gets the file-type metadata for all files in a dataset.

#### Method

`GET`

#### URL

`/v1/objdet/datasets/{PK}/file-types`

#### Parameters

  * `PK`: int (primary key of the dataset)

#### Permissions

  * [user is a member of the team that owns the dataset](permissions.md#ismember), or
  * [user is admin](permissions.md#isadminuser)
  
#### Response

  A JSON object from filename to:

  * format (optional): str (the file format)
  * dimensions (optional): array of 2 ints (the `[width, height]` of the image/video) 
  * length (optional): float (video length in seconds, absent for images)
