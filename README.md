[![Build Status](https://travis-ci.com/K-S-A/omniauth-pentagon-oauth2.svg?token=BnEswHarRUyMKXU1sugF&branch=master)](https://travis-ci.com/K-S-A/omniauth-pentagon-oauth2)

# Omniauth Pentagon Oauth2

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth-pentagon-oauth2`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-pentagon-oauth2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-pentagon-oauth2

## Usage

### Devise

First define your application id and secret in `config/initializers/devise.rb`.

Configuration options can be passed as the last parameter here as key/value pairs.

```ruby
config.omniauth :pentagon_oauth2,
                ENV['PENTAGON_CLIENT_ID'],
                ENV['PENTAGON_CLIENT_SECRET'],
                client_options: {
                  site: ENV['PENTAGON_CLIENT_SITE_URL']
                }
```

Make sure your model is omniauthable. Generally this is `/app/models/user_identity.rb`

```ruby
devise :omniauthable, omniauth_providers: [:pentagon_oauth2]
```

Do not forget to update `config/routes.rb`:

```ruby
devise_for :user_identities, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
```

And add callbacks controller:

```ruby
class UserIdentities::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def pentagon_oauth2
    # ...
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/K-S-A/omniauth-pentagon-oauth2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/K-S-A/omniauth-pentagon-oauth2/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OmniauthPentagonOauth2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/K-S-A/omniauth-pentagon-oauth2/blob/master/CODE_OF_CONDUCT.md).
