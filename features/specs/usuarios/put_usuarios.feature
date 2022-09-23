# language: pt
@regression
@put_users
Funcionalidade: Put usuarios
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@put_user200
Cenário: [PUT] Atualizar um novo usuário um novo usuário com sucesso utilizando PUT na rota /usuarios
    Dado possuir um novo usuario cadastrado
    E possuir um payload para alterar o usuario cadastrado
    Quando realizar uma requisição PUT para a rota "/usuarios"
    Então validar que o usuario foi atualizado com sucesso




