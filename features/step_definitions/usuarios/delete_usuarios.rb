  
  Quando('realizar uma chamada delete para a rota {string}') do |endpoint|
    endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.delete(endpoint)
  end
  
  Então('validar que o usario foi excluido com sucesso') do #got: "Não é possível realizar DELETE em /usarios/11CBunQyYedJNEZy."
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(response_json['message']).to eq('Registro excluído com sucesso') 
    end
  end
  
  Dado('que possua um usario inexistente') do
    @id = Factory::Static.static_data('usuario_inexistente')
  end
  
  Então('validar que não e possivel exluir o usario inexistente') do #got: "Não é possível realizar DELETE em /usarios/EsseIdNaoExiste."
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(response_json['message']).to eq('Nenhum registro excluído') 
    end
  end