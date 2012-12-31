http_statuses = {
  successful:   200,
  created:      201,
  no_content:   204,
  bad_request:  400,
  unauthorized: 401,
  forbidden:    403,
  not_found:    404,
  server_error: 500,
}

for status, code in http_statuses
  eval <<-EOS
    RSpec::Matchers.define "be_#{status}" do

      match do |actual|
        actual.to_s == "#{code}"
      end

      failure_message_for_should do |actual|
        "Expected " + http_statuses.key(actual).to_s + " to be #{status.to_s}"
      end

    end
  EOS
end