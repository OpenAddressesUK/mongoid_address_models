# Mongoid Address Models

These are the core models used in the [Theodolite](https://github.com/OpenAddressesUK/theodolite) and [Distiller](https://github.com/OpenAddressesUK/distiller) projects.

Addresses are made up of the following components:

* PAO (String)
* SAO (String)
* Street (An instance of [Street](https://github.com/OpenAddressesUK/mongoid_address_models/blob/master/app/models/street.rb))
* Locality (An instance of [Locality](https://github.com/OpenAddressesUK/mongoid_address_models/blob/master/app/models/locality.rb))
* Town (An instance of [Town](https://github.com/OpenAddressesUK/mongoid_address_models/blob/master/app/models/town.rb))
* Postcode (An instance of [Postcode](https://github.com/OpenAddressesUK/mongoid_address_models/blob/master/app/models/postcode.rb))

## Installation

### In a Rails project

This Gem is packaged as a [Rails engine](http://guides.rubyonrails.org/engines.html), so you can use it in a Rails project by adding it to your Gemfile like so:

    gem "mongoid_address_models", github: "OpenAddressesUK/mongoid_address_models"

And running `bundle install`

### In a vanilla Ruby project

Add the gem to your Gemfile and `bundle install` as above, but made sure to require in your project:

    require 'mongoid_address_models/require_all'
