Before do
    @serverest_api = ServeRest.new
end

After('@post_produtos201')do
    @serverest_api.delete("/produtos/#{@id}")
end

After('@put_user200')do
    @serverest_api.delete("/usuarios/#{@id}")
end
