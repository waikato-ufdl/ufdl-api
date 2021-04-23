The server currently supports specification of 3 types of notification.

## Print Notification

  * message: str
  
## Email Notification

  * subject: str
  * body: str
  * to: array of str
  * cc: array of str
  * bcc: array of str
  
## Websocket Notification

To specify a web-socket notification, use an empty object.
