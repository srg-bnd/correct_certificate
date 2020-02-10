# Correct Certificate

Monitoring SSL certificates.

The monitored parameters:

* The certificate expires in less than 2 weeks

* The certificate expires in less than 1 week

* The certificate has expired

* SSL error

* Correct Certificate

## To start development

Install necessary dependencies:
* `Postgresql` -v 11 (or higher)
* `Redis` with access by password

Create copies of `.example` files and remove the `.example` extension from them:
* `.env`
Next, change the values of the variables.

Run `bundle install` to install missing gems
Run `rake db:create` to create the database
Run `rake db:migrate`
Run `rspec` to execute tests

## To run the server
To run the server with background jobs:
* Run command `foreman start`
To run the server without background jobs:
* Run command `bundle exec puma`

`Server starts on http://localhost:5000/`

