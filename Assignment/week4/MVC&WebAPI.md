## Difference between mvc controller and web api controller

Both MVC controllers and Web API controllers are used in ASP.NET applications for handling incoming HTTP requests, but they also have some differences:

1. Purpose:
The main purpose of MVC controllers is to handle requests related to rendering views and business logic related to those views.   
In contrast, Web API controllers are designed to handle requests related to data retrieval.

2. Return Types:
MVC controllers typically return views or partial views, whereas Web API controllers typically return data in the form of JSON or other data formats.

3. Routing:
MVC controllers are typically associated with a specific view or set of views, and the routing is typically defined based on the URL path and query string parameters.   
Web API controllers are typically associated with a specific data entity or set of entities, and the routing is based on the HTTP verb and the data entity being manipulated.
