Heisenberg
=======

Acceptance test for REST apis.

Installation
---------

Simply add the gem to your project's Gemfile:

    gem 'heisenberg', group: :test

and then run the bundle command:

    $ bundle

Usage
-----

First of all, we must set our spec to use Heisenberg by setting the spec type to rest_api.

```ruby
require "spec_helper"

describe "My awesome REST API", type: :rest_api
  it "should do something awesome"
end
```

By default, all specs under the rest_apis directory will use Heisenberg, allowing you to ommit the type declaration.

To send messages to your api you can call any of these methods:

```ruby
get "/people"
post "/people", person: { name: "Chuck Norris" }
delete "/people/1"
put "/people/1", person: { name: "Jet Li" }
```

To get the response body from the last request you can call the response_body method, which will return the response body parsed to a HashWithIndifferentAccess. For example:

```ruby
get "/people/1"
expect(response_body).to be_eql {person: {name: "Jet Li" }}
```

You can get the response status code from the last request and do expectations using Heisenberg's status code matchers, as follows:

```ruby
get "/people/1"
expect(response_status).to be_successful
```

Other status code matchers available are:

```ruby
expect(response_status).to be_successful
expect(response_status).to be_forbidden
expect(response_status).to be_bad_request
expect(response_status).to be_created
expect(response_status).to be_unauthorized
expect(response_status).to be_server_error
expect(response_status).to be_not_found
expect(response_status).to be_no_content
```

Contributing
------------

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
