Dado('possuir um id de um produto cadastrado') do
    @id = Factory::Static.static_data('idProduto')
  end

    Quando('enviar uma requisição para o endpoint {string} com o método {string} e um payload de produto com quantidade {int}') do |endpoint, post, int|
        @response = @serverest_api.post(string, @payload)
        log Utils.log_response('POST', string, @response.body)
      end
      
      Dado('um payload de pruduto com quantidade zero') do
        @payload = {
            "produtos": [
                {
                    "idProduto": "BeeJh5lz3k6kSIzA",
                    "quantidade":  0    }
            ]
        }
      end

      Então('validar o status code e a mensagem de retorno') do
        response_json = JSON.parse(@response.body)
        aggregate_failures do
          expect(@response.status).to eql 200
          expect(response_json).to eql "message": "Registro excluído com sucesso"
        end
        end

