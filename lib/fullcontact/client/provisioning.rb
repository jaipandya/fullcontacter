module FullContact
  class Client
    module Provisioning
      # Public:The Provisioning method creates a new API key based on an
      # Account Key. This method is useful when your application has many end
      # users that you would like to track separately. An account key is
      # required for accessing this api method. This account key can be
      # initialized through the configure method. For getting an account key,
      # send an email to  support@fullcontact.com.
      #
      # Example
      #
      #   api_key = FullContact.create_new_api_key
      #
      # Returns a hash which contains the generated api_key and monthly quota
      def create_new_api_key
        # return error if no provisioning key defined
        return unless FullContact.options[:account_key]
        self.endpoint = 'https://api.fullcontact.com/apiKey'
        options = {:accountKey => FullContact.options[:account_key]}
        get('new', options)
      end
      
    end
    
  end
  
end