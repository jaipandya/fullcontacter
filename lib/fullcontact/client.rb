module FullContact
  # Wrapper for the FullContact REST API

  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'fullcontact/client/person'
    require 'fullcontact/client/user'
    require 'fullcontact/client/contact_list'
    require 'fullcontact/client/contact'
    require 'fullcontact/client/snapshot'
    require 'fullcontact/client/subscription'
    require 'fullcontact/client/name'
    require 'fullcontact/client/icon'
    require 'fullcontact/client/provisioning'
    require 'fullcontact/client/batch_process'

    alias :api_endpoint :endpoint

    include FullContact::Client::Person
    include FullContact::Client::User
    include FullContact::Client::ContactList
    include FullContact::Client::Contact
    include FullContact::Client::Snapshot
    include FullContact::Client::Subscription
    include FullContact::Client::Name
    include FullContact::Client::Icon
    include FullContact::Client::Provisioning
    include FullContact::Client::BatchProcess
  end
end
