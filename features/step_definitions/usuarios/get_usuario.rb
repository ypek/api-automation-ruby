
  
  Então('validar que foram retornados usuários') do
    #binding.pry
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eq(200)
      expect(response_json['quantidade']).to be > 0
      expect(response_json['usuarios'].size).to be > 1
      expect(response_json['usuarios'].class).to be_kind_of(Array.class)
      expect(response_json['quantidade'].class).to be_kind_of(Integer.class)
    end
    
  end


  Dado("possuir um id de usuario {string}") do |user_type|
    @id = Factory::Static.static_data(user_type)

  end
  
  Então('validar que foi retornado o usuario') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eq(200)
      expect(response_json['nome']).not_to be nil
      expect(response_json['email']).not_to be nil
      expect(response_json['password']).not_to be nil
      expect(response_json['administrador']).not_to be nil
      expect(response_json['_id']).not_to be nil
    end
    # {
    #  "nome": "Fulano da Silva",
    #  "email": "fulano@qa.com",
    #  "password": "teste",
    #  "administrador": "true",
    #  "_id": "0uxuPY0cbmQhpEz1"
    # }
  end
  

  Então('validar que nao foram retornados usuários') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eq(400)
      expect(response_json['message']).to eq('Usuário não encontrado')
    end
    #{
   #"message": "Usuário não encontrado"
   # }
    
  end