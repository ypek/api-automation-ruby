
  Quando('realizar uma chamada POST para a rota {string}') do |string|
    @response = @serverest_api.post(string, @payload)
  end

