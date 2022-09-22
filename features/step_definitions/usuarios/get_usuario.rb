Quando('realizar uma chamada GET para {string}') do |path|
  path = "#{path}/#{@id}" unless @id.nil?
  @response = @serverest_api.get(path)
  log Utils.log_response('GET', path, @response.body)
end




  Dado("possuir um id de usuario {string}") do |user_type|
    @id = Factory::Static.static_data(user_type)

  end
  
  Então('validar que foi retornado o status code {int} e o schema {string}') do |status_code, schema_name| #Ta retornando o body do json com varios usuario
    response_json = JSON.parse(@response.body)
    schema = Utils.get_schema(schema_name)
    aggregate_failures do
      expect(@response.status).to eql status_code
      expect(JSON::Validator.validate!(schema, response_json)).to be true
      #expect(@response.status).to eq(200)
      #expect(response_json['nome']).not_to be nil
      #expect(response_json['email']).not_to be nil
      #expect(response_json['password']).not_to be nil
      #expect(response_json['_id']).not_to be nil
    end

    # {
    #  "nome": "Fulano da Silva",
    #  "email": "fulano@qa.com",
    #  "password": "teste",
    #  "administrador": "true",
    #  "_id": "0uxuPY0cbmQhpEz1"
    # }

  end



  
  






  