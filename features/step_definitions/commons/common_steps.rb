Quando('realizar uma chamada GET para {string}') do |endpoint|
  endpoint = "#{endpoint}/#{@id}" unless @id.nil?
  @response = @serverest_api.get(endpoint)
  log Utils.log_response('GET', endpoint, @response.body)
end

  Quando('realizar uma chamada POST para {string}') do |endpoint|
    @response = @serverest_api.post(endpoint, @payload)
    log Utils.log_response('POST', endpoint, @response.body)
  end

  Então('validar que foi retornado o status code {int} e o schema {string}') do |status_code, schema_name| 
    response_json = JSON.parse(@response.body)
    schema = Utils.get_schema(schema_name)
    aggregate_failures do
      expect(@response.status).to eql status_code
      expect(JSON::Validator.validate!(schema, response_json)).to be true
    end
  end

  Quando('realizar uma chamada delete para a rota {string}') do |endpoint|
    endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.delete(endpoint)
    log Utils.log_response('GET', endpoint, @response.body)
  end

  Quando('realizar uma requisição PUT para a rota {string}') do |endpoint|
    @endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.put(@endpoint, @payload)
    log Utils.log_response('GET', endpoint, @response.body)
  end

  Então('Validar que foi retornado o status code {int} e o schema {string}') do |status_code, message|
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql status_code
      expect(response_json['message']).to eql message
    end

  end
  Então('validar que foi retornado o status code {int} e a mensagem {string}') do |int, string|
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql int
      expect(response_json['message']).to eql string
    end
  end

  Dado('possuir um token de acesso setado nas chamadas da api') do
    @serverest_api.set_access_token
  end

  



