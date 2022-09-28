# language: pt
@post_carrinho
Funcionalidade: Delete usuários
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços

@post_carrinho400
Cenário: add produto ao carrinho com quantidade 0
    Dado possuir um token de acesso setado para um usuario do tipo "usuario_nao_admin"
    E possuir um id de um produto cadastrado
    E um payload de pruduto com quantidade zero
    Quando realizar uma chamada POST para "/carrinhos" 
    Então validar o status code e a mensagem de retorno

    


