module FullContact
  class Client
    module Person
      # Public: Uses the person method to request more information about a specific person by email
      #
      # email   - The email address of the person being looked up.
      # options - Hash containing additional arguments (optional) (default: {})
      #           :timeOutSeconds - Wait for specified time, before returning a 202 (optional)
      #           :queue          - Enqueue this email for indexing (optional)
      #           :callback       - If specified, the response will be wrapped as JSONP in a function call. (optional)
      #           :webhookUrl     - Delivers lookup response at specified url (required for webhook calls)
      #           :webhookId      - Id for tracking the webhook
      #
      # Example
      #
      #   response = FullContact.lookup_by_email('prafulla.kiran@gmail.com')
      def lookup_by_email(email, options = {})
        options[:email] = email
        get('person', options)
      end

      # Public: Uses the person method to request more information about a specific person by phone
      #
      # phone   - The phone number of the person being looked up.
      # options - Hash containing additional arguments (optional) (default: {})
      #           :timeOutSeconds - Wait for specified time, before returning a 202 (optional)
      #           :queue          - Enqueue this email for indexing (optional)
      #           :callback       - If specified, the response will be wrapped as JSONP in a function call. (optional)
      #           :webhookUrl     - Delivers lookup response at specified url (required for webhook calls)
      #           :webhookId      - Id for tracking the webhook
      #
      # Example
      #
      #   response = FullContact.lookup_by_phone('+910020000200')
      def lookup_by_phone(phone, options = {})
        options[:phone] = phone
        get('person', options)
      end

      # Public: Uses the person method to request more information about a specific person by twitter
      #
      # twitter - The twitter handle of the person being looked up.
      # options - Hash containing additional arguments (optional) (default: {})
      #           :timeOutSeconds - Wait for specified time, before returning a 202 (optional)
      #           :queue          - Enqueue this email for indexing (optional)
      #           :callback       - If specified, the response will be wrapped as JSONP in a function call. (optional)
      #           :webhookUrl     - Delivers lookup response at specified url (required for webhook calls)
      #           :webhookId      - Id for tracking the webhook
      #
      # Example
      #
      #   response = FullContact.lookup_by_twitter('prafulla')
      def lookup_by_twitter(twitter, options = {})
        options[:twitter] = twitter
        get('person', options)
      end

      # Public: Uses the person method to request more information about a specific person by facebook
      #
      # facebookUsername   - The facebook username of the person being looked up.
      # options - Hash containing additional arguments (optional) (default: {})
      #           :timeOutSeconds - Wait for specified time, before returning a 202 (optional)
      #           :queue          - Enqueue this email for indexing (optional)
      #           :callback       - If specified, the response will be wrapped as JSONP in a function call. (optional)
      #           :webhookUrl     - Delivers lookup response at specified url (required for webhook calls)
      #           :webhookId      - Id for tracking the webhook
      #
      # Example
      #
      #   response = FullContact.lookup_by_facebook('prafullakiran')
      def lookup_by_facebook(facebookUsername, options = {})
        options[:facebookUsername] = facebookUsername
        get('person', options)
      end

      # Public: Uses the person method to request more information about a specific person by vCard
      #
      # vcard_data  - vcard information of the user being looked up (as a string)
      # options     - Hash containing additional arguments (optional) (default: {})
      #             :queue - Enqueue this email for indexing (optional)
      #
      # Example
      #
      #   response = FullContact.lookup_by_vcard(vcard_data)
      def lookup_by_vcard(vcard_data, options = {})
        self.format = 'vcf'
        options[:content_type] = 'text/x-vcard'
        options[:request_body] = vcard_data
        post('person', options)
      end

    end
  end
end
