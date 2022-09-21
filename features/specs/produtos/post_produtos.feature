# language: pt
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
    Então validar que um novo produto foi cadastrado com sucesso

@post_produtos400
Cenário: Tentar cadastrar um produto com nome já cadastrado
    Dado possuir um produto cadastrado 
    E possuir um payload com um nome de produto já cadastrado
    Quando realizar uma chamada POST para "/produtos" 
    Então validar que nao foi possivel cadastrar um novo produto com nome repetido


    