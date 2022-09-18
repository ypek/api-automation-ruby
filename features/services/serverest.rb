class ServeRest
    include Excon # biblioteca para fazer requisições HTTP
    attr_accessor :base_uri

    def initialize
        self.base_uri = $base_uri
        @headers = { 'Content-Type' => 'application/json' }
    end

    def get(endpoint)
        Excon.get(base_uri + endpoint,
            headers: @headers
        )
    end
    
    def post(endpoint, payload)
        Excon.post(base_uri + endpoint,
            headers: @headers,
            body: payload.to_json
        )
    end

   
end