require 'helper'
require 'fullcontact'

describe FullContact::Client::Contact do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  # describe "#update_contact" do
  #   before do
  #     stub_post("contactLists/12345.json").
  #       with(:query => { :apiKey => "api_key", :request_body => "", :content_type => "application/json") }, :headers => {'Accept'=>'application/json', 'Content-Length'=>'0', 'Content-Type'=>'application/json', 'User-Agent'=>'FullContact Ruby Gem'}).
  #       to_return(:body => fixture("update_contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
  #   end
  #   it "should send a post to contactLists" do
  #     @client.update_contact("12345", {:contact_data => {}})
  #     a_post("contactLists/12345.json").with(:query => { :apiKey => "api_key" }).should have_been_made
  #   end
  # end

  describe "#get_contact" do
    before do
      stub_get("contactLists/12345/54321.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("get_contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get the contact" do
      @client.get_contact("12345", "54321")
      a_get("contactLists/12345/54321.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#delete_contact" do
    before do
      stub_delete("contactLists/12345/54321.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("delete_contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should delete the contact" do
      @client.delete_contact("12345", "54321")
      a_delete("contactLists/12345/54321.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#has_enriched_updates?" do
    before do
      stub_get("contactLists/12345/54321/hasUpdates.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("has_enriched_updates.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should make a get to find whether or not there are enriched updates" do
      @client.has_enriched_updates?("12345", "54321")
      a_get("contactLists/12345/54321/hasUpdates.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#get_updates" do
    before do
      stub_get("contactLists/12345/54321/updates.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("get_updates.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get the latest updates" do
      @client.get_updates("12345", "54321")
      a_get("contactLists/12345/54321/updates.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#get_enriched_contact" do
    before do
      stub_get("contactLists/12345/54321/enriched.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("get_enriched_contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get the enriched contact" do
      @client.get_enriched_contact("12345", "54321")
      a_get("contactLists/12345/54321/enriched.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#save_enriched_contact" do
    before do
      stub_post("contactLists/12345/54321/enriched.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("save_enriched_contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should save the enriched contact" do
      @client.save_enriched_contact("12345", "54321")
      a_post("contactLists/12345/54321/enriched.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#contact_history" do
    before do
      stub_get("contactLists/12345/54321/history.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("contact_history.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get the contact history" do
      @client.contact_history("12345", "54321")
      a_get("contactLists/12345/54321/history.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end
end
