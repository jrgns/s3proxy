# S3Proxy

S3Proxy provides an easy way to proxy and cache access to files on S3 through
your Rack app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 's3proxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install s3proxy

## Usage

S3Proxy is a module that allows you to add the `proxy_s3_file` method to your
class. You can also add it as a helper to your Sinatra app:

```
# app.rb
require 's3proxy'

class App < Sinatra::Base
    helpers ::S3Proxy

    get '/s3/*' do |filename|
      matches = filename.match(/([^\/]+)\/(.*)/)
      bucket = matches[1]
      key = matches[2]
      send_file proxy_s3_file(bucket, key)
    end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jrgns/s3proxy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

