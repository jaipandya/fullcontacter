require 'helper'
require 'fullcontact'

describe FullContact::Client::Snapshot do
  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#create_snapshot" do
    before do
      stub_post("contactList/12345/snapshot.json").
        with(:query => { :apiKey => "api_key", :name => 'foo' }).
        to_return(:body => fixture("create_snapshot.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should create a snapshot " do
      @client.create_snapshot("12345", {:name => 'foo' })
      a_post("contactList/12345/snapshot.json").with(:query => { :apiKey => "api_key", :name => 'foo' }).should have_been_made
    end
  end

  describe "#list_snapshots" do
    before do
      stub_get("contactList/12345/snapshot.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("list_snapshots.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should list all snapshots " do
      @client.list_snapshots("12345")
      a_get("contactList/12345/snapshot.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end
end
