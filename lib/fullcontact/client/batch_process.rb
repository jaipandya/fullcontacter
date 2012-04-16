module FullContact
  class Client
    module BatchProcess
      # Public: The Batch Process endpoint allows you to batch several API
      # requests into a single request to improve performance by eliminating
      # excess network overhead. This endpoint will proxy requests (up to 20
      # per batch) on your behalf to any other API endpoint which accepts GET
      # requests.
      #
      # Yields array of URLs to api endpoints
      #
      # Example
      #
      #   respnose = FullContact.batch do 
      #     [FullContact.normalize('Mr. John Michael Smith'),
      #      FullContact.deduce_by_email('johnsmith@gmail.com')]
      #     end
      #   'response' contains batch response from the api
      #
      # Returns response from different api methods in the batch
      def batch(options = {})
        FullContact.configure do |config|
          config.get_request_url_only = true
        end
        batch_method_list = yield
        FullContact.configure do |config|
          config.get_request_url_only = false
        end
        options[:content_type] = 'application/json'
        options[:request_body] = {:requests => batch_method_list}.to_json
        post("batch", options)
      end
    end
  end
end