require 'helper'
require 'fullcontact'

describe FullContact::Client::ContactList do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#create_contact_list" do
    before do
      stub_post("contactLists.json").
        with(:query => { :apiKey => "api_key" }).
        to_return(:body => fixture("create_contact_list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should send a post to contactLists" do
      @client.create_contact_list
      a_post("contactLists.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#delete_contact_list" do
    before do
      stub_delete("contactLists/12345.json").
        with(:query => { :apiKey => "api_key"}).
        to_return(:body => fixture("delete_contact_list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should send a delete to contactLists" do
      @client.delete_contact_list("12345")
      a_delete("contactLists/12345.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#get_contact_lists" do
    before do
      stub_get("contactLists.json").
        with(:query => { :apiKey => "api_key"}).
        to_return(:body => fixture("get_contact_lists.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the list of contact lists" do
      @client.get_contact_lists
      a_get("contactLists.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#get_contacts_in_a_list" do
    before do
      stub_get("contactLists/12345.json").
        with(:query => { :apiKey => "api_key"}).
        to_return(:body => fixture("get_contacts_in_a_list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the contacts in a list" do
      @client.get_contacts_in_a_list(12345)
      a_get("contactLists/12345.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#queue_contact_list_for_enrichment" do
    before do
      stub_post("contactLists/12345/queue.json").
        with(:query => { :apiKey => "api_key"}).
        to_return(:body => fixture("queue_contact_list_for_enrichment.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should queue the contact list for enrichment" do
      @client.queue_contact_list_for_enrichment("12345")
      a_post("contactLists/12345/queue.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end

  describe "#clear_contact_list" do
    before do
      stub_post("contactLists/12345/clear.json").
        with(:query => { :apiKey => "api_key"}).
        to_return(:body => fixture("clear_contact_list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should clear the contacts in a list" do
      @client.clear_contact_list("12345")
      a_post("contactLists/12345/clear.json").with(:query => { :apiKey => "api_key" }).should have_been_made
    end
  end
end
