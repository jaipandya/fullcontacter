require 'rspec'
require 'webmock/rspec'
require 'simplecov'
require 'lib/fullcontact'
require 'ruby-debug'

SimpleCov.start


def a_get(path)
  a_request(:get, FullContact.endpoint + path)
end

def a_post(path)
  a_request(:post, FullContact.endpoint + path)
end

def a_delete(path)
  a_request(:delete, FullContact.endpoint + path)
end

def stub_get(path)
  stub_request(:get, FullContact.endpoint + path)
end

def stub_post(path)
  stub_request(:post, FullContact.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, FullContact.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
