# language: pt
@regression
@post_produtos
Funcionalidade: post produtos
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços

@post_produtos201
Cenário: Cadastrar um produto com sucesso na API ServeRest
    Dado possuir um token de acesso setado para um usuario do tipo "usuario_admin"
    E possuir um payload de produto válido
    Quando realizar uma chamada POST para "/produtos" 
    #Então validar que um novo produto foi cadastrado com sucesso
    Então validar que foi retornado o status code 201 e a mensagem "Cadastrado com sucesso"

@post_produtos400
Cenário: Tentar cadastrar um produto com nome já cadastrado
    Dado possuir um produto cadastrado 
    E possuir um payload com um nome de produto já cadastrado
    Quando realizar uma chamada POST para "/produtos" 
    #Então validar que nao foi possivel cadastrar um novo produto com nome repetido
    Então validar que foi retornado o status code 400 e a mensagem "Já existe um produto com esse nome"

@post_produtos401
Cenário: Tentar cadastrar um produto sem token setado
    Dado possuir um payload de produto válido
    Quando realizar uma chamada POST para "/produtos" 
    #Então validar que foi solocitado um token de acesso para cadastrar um novo produto
    Então validar que foi retornado o status code 401 e a mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

@post_produtos403
Cenário: Tentar cadastrar um produto sem ser admministrador
    Dado possuir um token de acesso setado para um usuario do tipo "usuario_nao_admin"
    E possuir um payload de produto válido
    Quando realizar uma chamada POST para "/produtos" 
    #Então validar que usuario nao administrador nao pode cadastrar um novo produto
    Então validar que foi retornado o status code 403 e a mensagem "Rota exclusiva para administradores"

    


    