# language: pt
@login
Funcionalidade: login usuários
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
@login_branco
Cenário: login com email e senha em branco
    Dado que tenha um usuário com email e senha em branco
    Quando realizar uma chamada POST para "/login"
    Então será exibida uma mensagem de erro
    
@login_invalido
Cenario: login com email inválido
    Dado que tenha um usuário com email inválido
    Quando realizar uma chamada POST para "/login"
    Então será exibida uma mensagem de erro e status code 400

