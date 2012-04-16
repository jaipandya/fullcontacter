require 'helper'
require 'fullcontact'

describe FullContact::Client::Person do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#lookup_by_email" do
    before do
      stub_get("person.json").
        with(:query => { :apiKey => "api_key", :email => 'email'}).
        to_return(:body => fixture("person.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the list of contact lists" do
      @client.lookup_by_email('email')
      a_get("person.json").with(:query => { :apiKey => "api_key", :email => 'email' }).should have_been_made
    end
  end

  describe "#lookup_by_phone" do
    before do
      stub_get("person.json").
        with(:query => { :apiKey => "api_key", :phone => 'phone'}).
        to_return(:body => fixture("person.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the list of contact lists" do
      @client.lookup_by_phone('phone')
      a_get("person.json").with(:query => { :apiKey => "api_key", :phone => 'phone' }).should have_been_made
    end
  end

  describe "#lookup_by_twitter" do
    before do
      stub_get("person.json").
        with(:query => { :apiKey => "api_key", :twitter => 'twitter'}).
        to_return(:body => fixture("person.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the list of contact lists" do
      @client.lookup_by_twitter('twitter')
      a_get("person.json").with(:query => { :apiKey => "api_key", :twitter => 'twitter' }).should have_been_made
    end
  end

  describe "#lookup_by_facebook" do
    before do
      stub_get("person.json").
        with(:query => { :apiKey => "api_key", :facebookUsername => 'facebookUsername'}).
        to_return(:body => fixture("person.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the list of contact lists" do
      @client.lookup_by_facebook('facebookUsername')
      a_get("person.json").with(:query => { :apiKey => "api_key", :facebookUsername => 'facebookUsername' }).should have_been_made
    end
  end

  # describe "#lookup_by_vcard" do
  #   before do
  #     stub_post("person.vcf").
  #       with(:query => { :apiKey => "api_key", :request_body => {}, :content_type => 'text/x-vcard' }).
  #       to_return(:body => fixture("person.json"), :headers => {:content_type => "application/json; charset=utf-8"})
  #   end

  #   it "should get the list of contact lists" do
  #     @client.lookup_by_vcard({})
  #     a_post("person.vcf").with(:query => { :apiKey => "api_key" }).should have_been_made
  #   end
  # end
end
