The API supports generic filtering, which is applied to the database backend.
Whilst very flexible, this also requires the knowledge of the underlying database 
field names.


## Top-level

```json
{
  "expressions": [ ... expressions ... ],
  "order_by": [ ... orderings ... ],
  "include_inactive": true/false
}
```

* `expressions` is an array of expressions which filter the list. 
  Each is applied in order, further filtering the result of the previous expressions.
* `order_by` is a list of orderings, in order of precedence.
* `include_inactive` is optional, and defaults to false if omitted. 
  Otherwise it determines whether soft-deleted objects are included in the result.


### Expressions

The following expressions (`type`) are available:

  * `or` - can contain `and(s)` and other expressions

    * `sub_expressions` - the sub-expressions to combine via logical OR

  * `and` - cannot contain `or(s)` but other expressions

    * `sub_expressions` - the sub-expressions to combine via logical AND

  * `exact` - for exact matching of bool/int/float/str

    * field: str - the field to work on
    * value: bool/int/float/str - the value to match
    * case_insensitive: bool - for strings only
    * invert: bool - whether invert the matching, i.e., logical NOT 

  * `contains` - for sub-string matching

    * field: str - the field to work on
    * value: str - the sub-string to look for
    * case_insensitive: bool
    * invert: bool - whether invert the matching, i.e., logical NOT 

  * `is_null` - checks for NULL values

    * field: str - the field to work on
    * invert: bool - whether invert the matching, i.e., logical NOT 

  * `compare`

    * field: str - the field to work on
    * operator: str - the comparison to perform (<, >, >=, <=)
    * value: bool/int/float/str - the value to compare against
    * invert: bool - whether invert the comparison, i.e., logical NOT 


### Order by

```json
{
  "field": "my_field",
  "ascending": true/false,
  "nulls_first": true/false
}
```

* `field`: str - the field to enforce the ordering on
* `ascending`: bool - ascending or descending
* `nulls_first`: bool (optional) - whether nulls are listed first or last, 
  uses database default if omitted

## Example

The following filter searches for anyone with rob in their name (Robert, Robbie, etc.) 
who is not exactly 2m tall, unless their name is Robert, in which case they must be exactly
1.75m tall. Ignores the case of the names. Returns people in order of tallest to
shortest, then alphabetically if their height is the same, and then by some
mysterious third field for people with the same height and name.


```json
{
  "expressions": [
    {
      "sub_expressions": [
        {
          "sub_expressions": [
            {
              "field": "name",
              "value": "robert",
              "case_insensitive": true,
              "type": "exact"
            },
            {
              "field": "height",
              "value": 1.75,
              "type": "exact"
            }
          ],
          "type": "and"
        },
        {
          "sub_expressions": [
            {
              "field": "name",
              "value": "robert",
              "case_insensitive": true,
              "invert": true,
              "type": "exact"
            },
            {
              "field": "name",
              "sub_string": "rob",
              "case_insensitive": true,
              "type": "contains"
            },
            {
              "field": "height",
              "value": 2.0,
              "invert": true,
              "type": "exact"
            }
          ],
          "type": "and"
        }
      ],
      "type": "or"
    }
  ],
  "order_by": [
    {
      "field": "height",
      "ascending": false
    },
    {
      "field": "name"
    },
    {
      "field": "other",
      "nulls_first": true
    }
  ],
  "include_inactive": false
}
```
