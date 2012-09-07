require 'helper'

describe FullContact::Request do
  let(:client){FullContact::Client.new}
  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end

    stub_post("post/path.json").
      with(:query => { :apiKey => "api_key"}).
      to_return(:body => {}, :headers => {:content_type => "application/json; charset=utf-8"})
  end

  it "remove request_body from get parameters" do
    client.send(:request,:post, "post/path", {:request_body => "body content"})
    a_post("post/path.json").with(:query => { :apiKey => "api_key"}).should have_been_made.once
  end

  it "remove content_type from get parameters" do
    client.send(:request,:post, "post/path", {:content_type => "application/json"})
    a_post("post/path.json").with(:query => { :apiKey => "api_key"}).should have_been_made.once
  end

end
