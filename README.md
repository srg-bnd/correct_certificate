# Correct Certificate

Monitoring SSL certificates.


## Features

The monitored parameters:
* The certificate expires in less than 2 weeks
* The certificate expires in less than 1 week
* The certificate has expired
* SSL error
* Correct Certificate


## API

Format:
- API: `json`
- URL: `api/v1/path`

method  |path |action|
------------- |-------------| -------------
GET  |/status|state of the domains
POST |/domain|track the domain

### Description

- GET /status:
  - params
    - filters
        - name: String
    - order_column
        - created_at: Datetime (default)
    - order_type: String
        - asc
        - desc (default)
    - page: Integer
    - per_page: Integer
  - response: Array
    - name: String
    - status: String

- POST /domain
  - params
    - name: String
  - response: Object
    - name: String
    - status: String


## Getting Started

### Development

Install necessary dependencies:
* `Postgresql` -v 11 (or higher)
* `Redis` with access by password

#### Prepare the server

Prepare the environment variables:
```bash
cp .env.example .env
```
And initialize variables in file `.env`:
- DATABASE_USERNAME
- DATABASE_PASSWORD
- SIDEKIQ_USERNAME
- SIDEKIQ_PASSWORD
- REDIS_PASSWORD
- REDIS_HOST

The last preparatory steps:
```bash
bundle install # install missing gems
rake db:create # create the database
rake db:migrate # prepare the database
rspec spec/ # run the tests
```

#### Starting the server

> Server starts on http://localhost:6000/

To run the server with background jobs:
```bash
gem install foreman
foreman start
```

To run the server without background jobs:
```bash
bundle exec puma
```


## License

Correct Certificate is released under the [MIT License](LICENSE.txt).
