Dado ('possuir um token de acesso setado para um usuario do tipo {string}') do |user_type|
    steps %{
        Dado possuir um playload de novo usuario do tipo "#{user_type}" para cadastrar
        Quando realizar uma chamada POST para "/usuarios" 
        Então validar que foi criado um novo usuario
    }
    payload = {
        'email': @payload[:email],
        'password': @payload[:password]
    }
    @serverest_api.set_access_token(payload)
    #payload = Factory::Static.static_data(user_type)
    #@serverest_api.set_access_token(payload)
    #log response
end

Dado('possuir um playload de novo usuario do tipo {string} para cadastrar') do |user_type|
    @payload = Factory::Dynamic.new_valid_user(user_type)
  end

Dado('possuir um payload de produto válido') do
    @payload = Factory::Dynamic.new_valid_product
end


  
  Então('validar que um novo produto foi cadastrado com sucesso') do

    # 1 - transformar o body do objeto de response do excon em json
    # 2 - validar o status code da response
    # 3 - validar que a mensagem de sucesso foi retornada
    # 4 - validar que é retornado o id no response do body

    response_json = JSON.parse(@response.body) # 1 - transformar o body do objeto de response do excon em json
    aggregate_failures do
      expect(@response.status).to eql 201     # 2 - validar o status code da response
      expect(response_json['message']).to eq 'Cadastro realizado com sucesso'   # 3 - validar que a mensagem de sucesso foi retornada
      expect(response_json['_id']).not_to be nil # 4 - validar que é retornado o id no response do body
    end

end

Dado('possuir um produto cadastrado') do
    steps %{
        Dado possuir um token de acesso setado para um usuario do tipo "usuario_admin"
            E possuir um payload de produto válido
            Quando realizar uma chamada POST para "/produtos" 
            Então validar que um novo produto foi cadastrado com sucesso
    }
    #log response

  end
  
  Dado('possuir um payload com um nome de produto já cadastrado') do
    @payload = Factory::Dynamic.new_valid_product
    @payload['nome'] = 'Produto de teste'

  end
  
  Então('validar que nao foi possivel cadastrar um novo produto com nome repetido') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(400)
        expect(response_json['message']).to eq('Já existe produto com esse nome')
    end

  end

  Então('validar que foi solocitado um token de acesso para cadastrar um novo produto') do

    response_json = JSON.parse(@response.body) # 1 - transformar o body do objeto de response do excon em json
    aggregate_failures do
      expect(@response.status).to eql 401     # 2 - validar o status code da response
      expect(response_json['message']).to eq 'Token de acesso ausente, inválido, expirado ou usuário do token não existe mais'   # 3 - validar que a mensagem de sucesso foi retornada
    end

  end
  Então("validar que usuario nao administrador nao pode cadastrar um novo produto") do
    response_json = JSON.parse(@response.body) # 1 - transformar o body do objeto de response do excon em json
    aggregate_failures do
      expect(@response.status).to eql 403     # 2 - validar o status code da response
      expect(response_json['message']).to eq 'Rota exclusiva para administradores'   # 3 - validar que a mensagem de sucesso foi retornada
    end
  end





  