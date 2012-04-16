module FullContact
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false)
      request(:get, path, options, raw)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false)
      request(:post, path, options, raw)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false)
      request(:delete, path, options, raw)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false)
      if FullContact.options[:get_request_url_only]
        return connection(raw).build_url(formatted_path(path), options)
      end
      options[:apiKey] = FullContact.options[:api_key]
      unless FullContact.options[:access_token].nil?
        options[:accessToken] = FullContact.options[:access_token]
      end
      response = connection(raw).send(method) do |request|
        request.url(formatted_path(path), options)
        request.headers["Content-Type"] = options[:content_type] if options.include?(:content_type)
        request.body = options[:request_body] if options.include?(:request_body)
      end
      raw ? response : response.body
    end

    def formatted_path(path)
      return path if format.to_s.empty?
      [path, format].compact.join('.')
    end
  end
end
