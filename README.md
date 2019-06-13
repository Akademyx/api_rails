# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.3.1
* System dependencies
Requires Vagrant

* Configuration
rails s -b 0.0.0.0    //is to start server

* Database creation
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

gem bundle install                     //this will install everything
rake db:migrate                        //to get the database in. If rake doesn't work, use:
rails db:migrate

rails s -b 0.0.0.0                     // to turn on the server and routes should be                                                available by typing:
rails routes

Pagination done with "pagy", implemented into "recipes" listing index controller