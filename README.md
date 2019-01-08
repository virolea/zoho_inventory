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
ZohoInventory.update(item_id, { name: "X-Wing", ... })

# Delete an item
ZohoInventory.delete(item_id)
```

The Zoho models avaiable in the gem are: `organizations`, `items` and `contacts`.

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
