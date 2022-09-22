
Quando('realizar uma chamada POST para {string}') do |string|
  @response = @serverest_api.post(string, @payload)
end

Dado('possuir um playload de novo usuario para cadastrar') do
    @payload = Factory::Dynamic.new_valid_user
  end
  
  
  Então('validar que foi criado um novo usuario') do
    @response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(201)
        expect(@response_json['message']).not_to be nil
        expect(@response_json['_id']).not_to be nil
        expect(@response_json['message']).to eq('Cadastro realizado com sucesso')
    end
  end

  Dado('possuir um playload de um usuario ja cadastrado') do
    @payload = {

        "nome": "Fulano da Silva",
        "email": "fulano@qa.com",
        "password": "teste",
        "administrador": "true",

    }

  end
  
  Então('validar que foi nao pfoi possivel criar um novo usuario') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(400)
        expect(response_json['message']).to eq('Este email já está sendo usado')
    end
  end

  Dado("possuir um novo usuario cadastrado") do

    steps %{
      Dado possuir um pdo realizar uma chamada POST para "/usuarios" 
      Então validar que foi criado um novo usuario
    }

    @id = @response_json['_id']
    
  end