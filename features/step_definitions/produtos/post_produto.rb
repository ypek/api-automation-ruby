Dado ('possuir um token de acesso setado para um usuario do tipo {string}') do |user_type|
    steps %{
        Dado possuir um payload de novo usuario do tipo "#{user_type}" para cadastrar
        Quando realizar uma chamada POST para "/usuarios"

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

Dado('possuir um payload de novo usuario do tipo {string} para cadastrar') do |user_type|
    @payload = Factory::Dynamic.new_valid_user(user_type)
  end

Dado('possuir um payload de produto válido') do
    @payload = Factory::Dynamic.new_valid_product
end


  

Dado('possuir um produto cadastrado') do
    steps %{
        Dado possuir um token de acesso setado para um usuario do tipo "usuario_admin"
            E possuir um payload de produto válido
            Quando realizar uma chamada POST para "/produtos" 
            Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    }
    #log response

  end
  
  Dado('possuir um payload com um nome de produto já cadastrado') do
    @payload = Factory::Dynamic.new_valid_product
    @payload['nome'] = 'Produto de teste'

  end

  Dado('possuir um payload de produto inválido com seu valor real positivo ou negativo') do
    @payload = Factory::Dynamic.new_valid_product
    @payload['preco'] = 12.12
  end

  Então('validar quer foi possivel cadastrar um novo produto com valor real positivo ou negativo') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql 201
      expect(response_json['preco']).to eql 'Cadastro realizado com sucesso'
    end
  end
  





  