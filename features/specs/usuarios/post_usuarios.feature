# language: pt
@post_users
Funcionalidade: Get usuarios
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@post_user201
Cenário: [POST] Cadastrar usuario com sucesso pela rota /usuarios
    Dado possuir um playload de novo usuario para cadastrar
    Quando realizar uma chamada POST para "/usuarios" 
    Então validar que foi criado um novo usuario
    
@post_user400
Cenário: [POST] Tentar casdastrar usuario com email já existente pela rota /usuarios
    #Dado possuir um playload de um usuario ja cadastrado
    Dado possuir um novo usuario cadastrado
    Quando realizar uma chamada POST para "/usuarios" 
    Então validar que foi nao pfoi possivel criar um novo usuario



