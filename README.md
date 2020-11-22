# Minicommerce

A working example of a Grape API mounted alongside Rails app that uses Trailblazer with Service Object Pattern / DDD.

## Dependencies

- Rails
- Grape
- Trailblazer

## Pattern

### Model

Using default model directory `app/models` from Rails. Handle primitive database only.

### Repository

In directory `app/concepts/*/repository`. Handle any persistent transaction.

### Contract

In directory `app/concepts/*/contract`. Handle any use case validation.

### Entity

In directory `app/concepts/*/entity`. Handle response to endpoint.

### Operation

In directory `app/concepts/*/operation`. Handle use case / business process.

### Policy

In directory `app/concepts/*/policy`. Handle user permission to use case.

### Endpoint

In directory `app/controllers/API`. Handle endpoint API.

## Playing Around

1. Clone the repository
1. bundle install
1. rake db:create
1. rake db:migrate
1. rake db:seed
1. rails s
1. Check swagger doc on http://localhost:3000/doc
1. Go to Auth and then click Explore button
1. Generate token
1. Use the token to play around in main API

## Test

- rake db:test:prepare
- rspec

## The Boring Legal Things

Copyright

Use whatever you wish if this repository inspire you
