require 'helper'
require 'fullcontact'

describe FullContact::Client::Name do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#get_social_icon_url" do
    before do
      stub_get("icon/facebook/32/default").
        with(:query => { :apiKey => "api_key"}).
        to_return(:status => [302, "Moved Temporarily"])
    end
    it "should get an icon url with 302 redirect" do
      @client.get_social_icon_url('facebook','32','default')
      a_get("icon/facebook/32/default").with(:query => { :apiKey => "api_key"}).should have_been_made
    end
  end
end