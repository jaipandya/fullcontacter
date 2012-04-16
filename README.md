FullContact Ruby Gem
====================
A Ruby wrapper for the [FullContact API](http://www.fullcontact.com/)

Installation
------------
    gem install fullcontacter

Documentation
-------------
[http://rdoc.info/gems/fullcontacter](http://rdoc.info/gems/fullcontacter)

Usage Examples
--------------
    require "rubygems"
    require "fullcontact"
    
    # This could go in an initializer
    FullContact.configure do |config|
      config.api_key = "fullcontact_api_key_goes_here"
    end
    
    # Get information about a email address
    person = FullContact.lookup_by_email('prafulla.kiran@gmail.com')
      
    # Get information about a twitter handle
    person2 = FullContact.lookup_by_twitter('prafulla')
    
    # Get person's family_name
    puts person.contact_info.family_name
    
    # Authenticate a user
    FullContact.authenticate( { :username => 'prafulla.kiran@gmail.com', :password => 'test' } )
    
    # Authentication is requred for all methods under the 'Contact' and 'ContactList' categories
    FullContact.get_contact_lists

Copyright
---------
Copyright (c) 2012 Brandon West, Jai Pandya, Prafulla Kiran

See [LICENSE](https://github.com/jaipandya/fullcontacter/blob/master/LICENSE.md) for details.
