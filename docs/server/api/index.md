# Server API

The UFDL server API is designed around an object-model, where the server maintains instances of a number of different
types of object, and requests to the server are made in the form of specifying the type of object or specific object
instance to interact with, followed by the interaction to perform and any parametrisation of that interaction.

Each type of object has a base set of interactions that are possible for that type:

- List: list all instances of a type of object.
- Create: create a new instance of a type of object.
- Retrieve: Get the details of an object instance.
- Update: Specify new details of an object instance.
- Partial Update: Specify a sub-set of new details for an object instance.
- Destroy: Remove an object instance from the server.

In addition to these, each type of object may opt into providing additional interactions.

To perform an interaction with an object type/instance on the server, an HTTP request is made. The combination of
HTTP verb (GET, POST, etc.) and URL specify the type of interaction being requested, and the parametrisation of the
request is done via either URL paths, URL params or request body data, depending on the interaction.

This section of the documentation contains:

- [End-Points](end_points/index.md):
    The object types that the server can maintain and the interactions available with 
    those types.
- [Messages](messages/index.md):
    The types of messages that can be used to parametrise interactions.
