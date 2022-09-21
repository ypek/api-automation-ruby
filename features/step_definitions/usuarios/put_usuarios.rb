Dado('possuir um payload para alterar o usuario cadastrado') do
    @nome_anterior = @payload[:nome]
    @payload[:nome] = 'Fulano da Silva Alterado'
  end
  
  Quando('realizar uma requisição PUT para a rota {string}') do |endpoint|
    @endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.put(@endpoint, @payload)
  end


  
  Então('validar que o usuario foi atualizado com sucesso') do
    @response_json = JSON.parse(@response.body)
    response_get = JSON.parse(@serverest_api.get(@endpoint).body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(@response_json['message']).to eql 'Registro alterado com sucesso'
        expect(response_get['nome']).not_to eql @nome_anterior
        expect(response_get['nome']).to eql 'Fulano da Silva Alterado'
        #expect(@response_json['nome']).not_to eq(@nome_anterior)
        #expect(@response_json['nome']).to eq('Fulano da Silva Alterado')
    end

  end