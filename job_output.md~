The executor classes that apply and run the job templates will
store (some of) the output of the jobs again for future use,
like final models, tensorboard events, android app.

# Fields

* job PK
* outputs (one or more); for each output:

  * name
  * type (model/zip/json/tensorboard/...)
  * data (the raw data, BLOB)


# Actions

## Add job output

requires:

  * job PK
  * output


## Update job output

Allow updating of outputs (add/delete/update)


## Delete job output

requires:

  * job PK

