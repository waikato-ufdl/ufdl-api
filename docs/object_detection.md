Additional object detection dataset operations.

For core dataset operations, see [here](datasets.md).

# Fields

Annotation objects:

  * x: int
  * y: int
  * width: int
  * height: int
  * label: str
  * polygon: polygon object (optional)
  
Polygon objects:

  * points: array of array with two int values (x, y)

# URL

Uses `/v1/objdet/datasets/` instead of `/v1/datasets/`, 
also for the core operations.

# Actions

## Add annotations

POST: `/v1/objdet/datasets/{PK}/annotations/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (name of file to set annotations for)

Body:

  * annotations: array of Annotation objects

## Get annotations

GET: `/v1/objdet/datasets/{PK}/annotations/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (name of file to get annotations for)

Response:

  * array of Annotation objects

## Delete annotations

DELETE: `/v1/objdet/datasets/{PK}/annotations/{NAME}`

Parameters:

  * PK: int (primary key of dataset)
  * NAME: str (name of file to remove the annotations for)


## Get labels

GET: `/v1/objdet/datasets/{PK}/labels`

Parameters:

  * PK: int (primary key of dataset)

Response:

  * array of string labels present in dataset
