# PokemonAPI

## Synopsis

**PokemonAPI** it is a restful api, implemented an external api "Pokemon api" also added some logic on backend for receiving "Pokemons" and "Types" etc...

## Contribution

**Refactoring code**, e.g. improving the code without modifying the behavior is an area that can probably be done based on intuition and may not require much communication to be merged.

**Fixing bugs** may also not require a lot of communication, but the more the better. Please surround bug fixes with ample tests. Bugs are magnets for other bugs. Write tests near bugs!

### How to contribute

1.  Fork the project & clone locally.
2.  Create a branch, naming it contribute: git checkout -b contribute_to_pokemon_api
3.  Push to the branch: git push origin contribute_to_pokemon_api
4.  Create a pull request for your branch 🎉

Note: be sure to keep your fork in sync!

## Getting Started

### Setup

#### Requirements

Install these software at first


*  Ruby (recommended version => '3.1.0') - we recommend to use rbenv for installation
*  Rails (recommended version '7.0.2')
*  Sqlite3 v => 1.4.4
*  Bundler v => 2.3.6
*  Sidekiq v ~> 6.4
*  Sidekiq Cron v ~> 1.1

#### Installation

Once you clone this project from github or download it, make sure you run `update bundler` also after that `bundle install` to make sure every gem is successfully installed and ready to use.

### Starting the application

First thing you have to do is:
`rails db:create rails db:migrate & rails db:seed` . 
Or you can use `rails db:create` and than use `rails db:reset`

Before that if you have problem connecting with database you might use `sudo service postgresql start` - for Ubuntu

Before running the server i recommend you tu run:
    `rails routes` -> to see every possible route that you want to request.

Also make sure to run redis-server as we have 2 background jobs for fetching "Pokemons" and "Types" from PokeApi.

After that you can start by typing in terminal:
    `rails server` -> to run the server ( check 'localhost:3000/{endpoints}')


### Running tests

For testing i have user RSpec framework version `3.11.0`

To run all tests run:
`$ rspec` 

#### Nesseccary gems used for testing


*   gem 'rspec-rails', '~> 5.1.0'
*   gem 'factory_girl_rails' -> for creating factories
*   gem 'shoulda-matchers'

### Consuming the API

#### Consuming the external API for consuming data 

##### Pokemons

```
    pokemon = PokemonProxy::Pokemon.new
```

-> For getting all pokemons use method "get_pokemon" if no parameter provided will return all pokemons 

```
    pokemon.get_pokemon
```

-> For getting a specific pokemon send an id or name as a parameter 

```
    pokemon.get_pokemon(1)
```
or
```
    pokemon.get_pokemon("aggron")
```

##### Types

```
    type = PokemonProxy::Type.new
```

-> For getting all types use method "get_type" if no parameter provided will return all types 

```
    type.get_type
```

-> For getting a specific type send an id or name as a parameter 

```
    type.get_type(1)
```
or
```
    type.get_type("ground")
```

#### Consuming our API

We are using only two endpoints for now: 
``` 
    /v1/pokemons        # Will return all pokemons with attributes: id, name and types attributes
    /v1/pokemons/:id    # Will return all pokemons including other attributes as well
```

Results are all in json format.
