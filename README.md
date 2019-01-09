[![Build Status](https://travis-ci.org/Virolea/zoho_inventory.svg?branch=master)](https://travis-ci.org/Virolea/zoho_inventory) [![Test Coverage](https://api.codeclimate.com/v1/badges/47c8158aec1128ce892d/test_coverage)](https://codeclimate.com/github/Virolea/zoho_inventory/test_coverage) [![Maintainability](https://api.codeclimate.com/v1/badges/47c8158aec1128ce892d/maintainability)](https://codeclimate.com/github/Virolea/zoho_inventory/maintainability)

⚠️ This is a work in progress, only CRUD operations are available for Zoho models for now, and models will be added gradually.

# ZohoInventory

This gem is a wrapper for the Zoho Inventory API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zoho_inventory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoho_inventory

## Usage

### Authentication

In order to authenticate to the Zoho Inventory API, do the following:

```ruby
ZohoInventory.auth_token = "REPLACE_WITH_YOUR_AUTH_TOKEN"
ZohoInventory.organization_id = "REPLACE_WITH_YOUR_ORGANIZATION_ID"
```

### Errors

Every API call that result in an error from zoho will result in a `ZohoError` exception thrown.

```ruby
begin
  # Zoho API Call
  ZohoInventory::Item.retrieve("item_id")
rescue ZohoError => e
  # Exception thrown
  puts e.message
end
```

### CRUD Operaions

The gem implements all CRUD operations available to the different Zoho models. [More info on available operations here](https://www.zoho.com/inventory/api/v1/)

For example, with items:

```ruby
# Create an item
ZohoInventory::Item.create({ name: "Death Star", ... })

# List all items
ZohoInventory::Item.list

# Retrieve an item
ZohoInventory::Item.retrieve(item_id)

# Update an item
ZohoInventory::Item.update(item_id, { name: "X-Wing", ... })

# Delete an item
ZohoInventory::Item.delete(item_id)
```

The Zoho models avaiable in the gem are: `organizations`, `items`, `users`, `invoices` and `contacts`.

Special model-specific actions such as `mark_as_active` will be added once all model CRUD actions are implemented. It will be documented below
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Virolea/zoho_inventory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ZohoInventory project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/zoho_inventory/blob/master/CODE_OF_CONDUCT.md).


## Contact

Ping me on [Twitter](https://twitter.com/V_Rolea) for any question!
