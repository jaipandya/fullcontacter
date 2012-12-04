require 'helper'
require 'fullcontact'

describe FullContact::Client::BatchProcess do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#batch" do
    before do
      stub_post("batch.json").
        with(:query => { :apiKey => "api_key" }).
        with(:body => "{\"requests\":[\"https://api.fullcontact.com/v2/person.json?email=aaron%40dfamedia.co.uk\",\"https://api.fullcontact.com/v2/person.json?email=a.pickup%40planet-group.co.uk\",\"https://api.fullcontact.com/v2/person.json?email=adrian.kerr%40dowjones.com\"]}").
        to_return(:body => fixture("batch_contacts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should send a post with batch" do
      @client.batch do
        [
          FullContact.lookup_by_email('aaron@dfamedia.co.uk'),
          FullContact.lookup_by_email('a.pickup@planet-group.co.uk'),
          FullContact.lookup_by_email('adrian.kerr@dowjones.com')
        ]
      end
      a_post("batch.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end
end
