Dado('que tenha um usuário com email e senha em branco') do
    @payload = {
        "email": "",
        "password": ""
    }
    end
  
  Então('será exibida uma mensagem de erro') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql 400
      expect(response_json).to eql "message": "Email e/ou senha inválidos"
    end
    end

    Dado('que tenha um usuário com email inválido') do
        @payload = {
            "email": "naoexite@alala.com",
            "password": "123123413"
        }
      end

      
  Então('será exibida uma mensagem de erro e status code 400') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql 400
      expect(response_json['message']).to eql "Email e/ou senha inválidos"
    end
  end




