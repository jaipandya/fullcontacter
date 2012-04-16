require 'helper'

describe FullContact::API do
  before do
    @keys = FullContact::Configuration::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do
     before do
      FullContact.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      FullContact.reset
    end

    it "should inherit module configuration" do
      api = FullContact::API.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :access_token => '23234e23',
          :account_key => 'account key',
          :adapter => :typhoeus,
          :api_key => 'api_key',
          :endpoint => 'http://tumblr.com/',
          :gateway => 'apigee-1111.apigee.com',
          :get_request_url_only => false,
          :format => :xml,
          :proxy => 'http://erik:sekret@proxy.example.com:8080',
          :user_agent => 'Custom User Agent',
        }
      end

      context "during initialization"

        it "should override module configuration" do
          api = FullContact::API.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end

      context "after initilization" do

        it "should override module configuration after initialization" do
          api = FullContact::API.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end
    end
  end
end
