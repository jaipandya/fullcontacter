require 'helper'
require 'fullcontact'

describe FullContact::Client::Subscription do
  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#create_subscription" do
    before do
      stub_post("contactList/12345/subscribe.json").
        with(:query => { :apiKey => "api_key", :event => 'enriched', :callback => 'http://example.com' }).
        to_return(:body => fixture("create_subscription.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should create a subscription " do
      @client.create_subscription("12345", { :event => 'enriched', :callback => 'http://example.com' })
      a_post("contactList/12345/subscribe.json").with(:query => { :apiKey => "api_key", :event => 'enriched', :callback => 'http://example.com' }).should have_been_made
    end
  end

  describe "#list_subscriptions" do
    before do
      stub_get("contactList/12345/subscribe.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("list_subscriptions.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should list all subscriptions" do
      @client.list_subscriptions("12345")
      a_get("contactList/12345/subscribe.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#delete_subscription" do
    before do
      stub_delete("contactList/12345/subscribe.json").
        with(:query => { :apiKey => "api_key", :subscription => "54321"  }).
        to_return(:body => fixture("delete_subscription.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should delete the given subscription" do
      @client.delete_subscription("12345", { :subscription => "54321" })
      a_delete("contactList/12345/subscribe.json").with(:query => { :apiKey => "api_key" , :subscription => "54321" }).should have_been_made
    end
  end
end
