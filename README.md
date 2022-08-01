# Dealership

Study project of car dealership

### Versions

- Ruby version `3.1.2`
- Rails version `7.0.3.1`

### System dependencies

- Docker
- Ruby and Rails versions above

### Configuration

- Run `docker compose up` (port `5432` must be available)
- Run `bundle install`

### Database creation

- Run `rake db:create`

### Database initialization

- Run `rake db:migrate`

### Database seed (optional)

- Run `rake db:seed`

### How to run the project

- Run `rails server` (port `3000` must be available)
- Access `http://localhost:3000`

### How to run the test suite

- Run `bundle exec rspec`
