module FullContact
  class Client
    module User
      # Public: Authenticate a user using the username and password. If 
      # authenticated, sets the returned access_token in a access_token config
      # variable 
      # 
      # options - a hash containing the user's username and password
      #
      # Example
      #
      #   FullContact.authenticate({ :username => 'prafullakiran@gmail.com',
      #                              :password => 'grizzlybear' })
      #   # we're authenticated now
      #   contact_lists = FullContact.get_contact_lists
      def authenticate(options = {})
        self.endpoint = 'https://api.fullcontact.com/auth/'
        self.format = ''
        access_token = post('token', options)

        FullContact.configure do |config|
          config.access_token = access_token
        end

      end
    end
  end
end
