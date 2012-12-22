Chewbacca
=======

Acceptance test for REST apis.

Installation
---------

Simply add the gem to your project's Gemfile:

    gem 'chewbacca', group: :test

and then run the bundle command:

    $ bundle

Usage
-----

First of all, we must set our spec to use chewbacca by setting the spec type to api_integration.

```ruby
require "spec_helper"

describe "My awesome REST API", type: :api_integration
  it "should do something awesome" 
end
```
 
By default, all specs under the api_integration directory will use chewbacca, allowing you to ommit the type declaration.

To send messages to your api you can call any of these methods:

```ruby
get "/people"
post "/people", person: { name: "Chuck Norris" }
delete "/people/1"
put "/people/1", person: { name: "Jet Li" }
```

To get the response body from the last request can call the response_body method, which will return the response body parsed to a HashWithIndifferentAccess. For example:

```ruby
get "/people/1"
expect(response_body).to be_eql {person: {name: "Jet Li" }}
```

You can get the response status code from the last request and do expectations using chewbacca's status code matchers, as follows:

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
