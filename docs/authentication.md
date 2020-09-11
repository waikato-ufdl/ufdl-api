Authentication is done via [JSON Web Tokens (JWT)](https://en.wikipedia.org/wiki/JSON_Web_Token).

# Actions

## Obtain

POST: `/v1/auth/obtain`

Body: 

  * username
  * password

Response:

  * access: str (JWT token for accessing API)
  * refresh: str (JWT token to refresh access token)

## Refresh

POST: `/v1/auth/refresh`

Body:

  * refresh: str (the JWT refresh token)

Response:

  * access: str (JWT token for accessing API)

## API calls

Subsequent API calls must include the *access* token in the 
`Authorization` HTTP header as follows:

```
Bearer <JWT access token>
```
