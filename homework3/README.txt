We checked with Vander Linden and he said that this homework is good to go.  We implemented a Firebase database and write new users
to the database.  We also read the score from the playerGame collection on our database and display it on the create-player
page.  

ANSWERS TO THE QUESTIONS:

a) This service is inherently RESTful since Firebase is RESTful by nature.  We are writing to a collection (POST) and reading from another 
collection (GET).

b) The PUT/CREAT endpoints are idempotent, but the GET/READ is nullipotent

(we did not use an API in homework 2)