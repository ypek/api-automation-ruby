Dado('possuir um payload de novo usuario para cadastrar') do
    @payload = Factory::Dynamic.new_valid_user
  end
  
  Dado('possuir um payload de novo usuario para cadastrar') do
    @payload = Factory::Dynamic.new_valid_user
  end
  

  Dado('possuir um novo usuario cadastrado') do
    steps %{
      Dado possuir um payload de novo usuario para cadastrar
      Quando realizar uma chamada POST para "/usuarios" 
    }
  end