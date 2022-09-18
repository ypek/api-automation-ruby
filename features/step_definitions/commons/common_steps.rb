Quando('realizar uma chamada GET para {string}') do |path|
    endpoint = "#{endpoint}/#{@id}" unless @id.nil?
    @response = @serverest_api.get(path)
  end

Quando('realizar uma chamada POST para {string}') do |endpoint|
@response = @serverest_api.post(endpoint, @payload)
end