require 'helper'
require 'fullcontact'

describe FullContact::Client::Name do

  before do
    FullContact.configure do |config|
      config.api_key = "api_key"
    end
    @client = FullContact::Client.new
  end

  describe "#normalize" do
    before do
      stub_get("name/normalizer.json").
        with(:query => { :apiKey => "api_key", :q => "John Smith" }).
        to_return(:body => fixture("normalize.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get normalized name" do
      @client.normalize('John Smith')
      a_get("name/normalizer.json").with(:query => { :apiKey => "api_key", :q => "John Smith" }).should have_been_made
    end
  end
  
  describe "#deduce_by_email" do
    before do
      stub_get("name/deducer.json").
        with(:query => { :apiKey => "api_key", :email => "johnsmith@gmail.com" }).
        to_return(:body => fixture("deduce_by_email.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get deduced name" do
      @client.deduce_by_email('johnsmith@gmail.com')
      a_get("name/deducer.json").with(:query => { :apiKey => "api_key", :email => "johnsmith@gmail.com" }).should have_been_made
    end
  end
  
  describe "#deduce_by_username" do
    before do
      stub_get("name/deducer.json").
        with(:query => { :apiKey => "api_key", :username => "johnsmith" }).
        to_return(:body => fixture("deduce_by_username.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get deduced name" do
      @client.deduce_by_username('johnsmith')
      a_get("name/deducer.json").with(:query => { :apiKey => "api_key", :username => "johnsmith" }).should have_been_made
    end
  end
  
  describe "#similarity" do
    before do
      stub_get("name/similarity.json").
        with(:query => { :apiKey => "api_key", :q1 => "john", :q2 => "john smith" }).
        to_return(:body => fixture("similarity.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get similarity" do
      @client.similarity('john', 'john smith')
      a_get("name/similarity.json").with(:query => { :apiKey => "api_key", :q1 => "john", :q2 => "john smith" }).should have_been_made
    end
  end
  
  describe "#stats_by_name" do
    before do
      stub_get("name/stats.json").
        with(:query => { :apiKey => "api_key", :name => "john" }).
        to_return(:body => fixture("stats_by_name.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get stats" do
      @client.stats_by_name('john')
      a_get("name/stats.json").with(:query => { :apiKey => "api_key", :name => "john" }).should have_been_made
    end
  end
  
  describe "#stats_by_given_name" do
    before do
      stub_get("name/stats.json").
        with(:query => { :apiKey => "api_key", :givenName => "john" }).
        to_return(:body => fixture("stats_by_given_name.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get stats" do
      @client.stats_by_given_name('john')
      a_get("name/stats.json").with(:query => { :apiKey => "api_key", :givenName => "john" }).should have_been_made
    end
  end
  
  describe "#stats_by_family_name" do
    before do
      stub_get("name/stats.json").
        with(:query => { :apiKey => "api_key", :familyName => "smith" }).
        to_return(:body => fixture("stats_by_family_name.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get stats" do
      @client.stats_by_family_name('smith')
      a_get("name/stats.json").with(:query => { :apiKey => "api_key", :familyName => "smith" }).should have_been_made
    end
  end
  
  describe "#stats_by_given_and_family_name" do
    before do
      stub_get("name/stats.json").
        with(:query => { :apiKey => "api_key", :givenName => 'john', :familyName => "smith" }).
        to_return(:body => fixture("stats_by_given_and_family_name.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get stats" do
      @client.stats_by_given_and_family_name('john','smith')
      a_get("name/stats.json").with(:query => { :apiKey => "api_key", :givenName => 'john', :familyName => "smith" }).should have_been_made
    end
  end
  
  describe "#parse" do
    before do
      stub_get("name/parser.json").
        with(:query => { :apiKey => "api_key", :q => 'Smith John' }).
        to_return(:body => fixture("parse.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "should get parsed name" do
      @client.parse('Smith John')
      a_get("name/parser.json").with(:query => { :apiKey => "api_key", :q => 'Smith John' }).should have_been_made
    end
  end
  
end