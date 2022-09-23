# language: pt
@regression
@get_users
Funcionalidade: Post usuários
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@get_usuarios200
Cenário: Realizar GET na rota /usuarios da API de teste
    Quando realizar uma chamada GET para "/usuarios" 
    #Então validar que foram retornados usuários
    Então validar que foi retornado o status code 200 e o schema "get_usuarios200"

@get_usuario200
Cenário: Realizar GET na rota /usuarios/{_id} com id valido
    Dado possuir um id de usuario "usuario_valido"
    Quando realizar uma chamada GET para "/usuarios" 
    Então validar que foi retornado o status code 200 e o schema "get_usuario200"

@get_usuarios400
Cenário: Realizar GET na rota /usuarios/{_id} com id invalido
    Dado possuir um id de usuario "usuario_invalido"
    Quando realizar uma chamada GET para "/usuarios" 
    #Então validar que nao foi retornado o usuario
    Então validar que foi retornado o status code 400 e o schema "get_usuarios400"



