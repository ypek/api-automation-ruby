# language: pt
@regression
@post_users
Funcionalidade: Get usuarios
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@post_user201
Cenário: [POST] Cadastrar usuario com sucesso pela rota /usuarios
    Dado possuir um payload de novo usuario para cadastrar
    Quando realizar uma chamada POST para "/usuarios" 
    Então Validar que foi retornado o status code 201 e o schema "Cadastro realizado com sucesso"
    
@post_user400
Cenário: [POST] Tentar casdastrar usuario com email já existente pela rota /usuarios
    Dado possuir um token de acesso setado nas chamadas da api
    E possuir um novo usuario cadastrado
    Quando realizar uma chamada POST para "/usuarios" 
    Então Validar que foi retornado o status code 201 e o schema "Cadastro realizado com sucesso"



