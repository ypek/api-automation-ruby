# language: pt
@delete_users
Funcionalidade: Delete usuários
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@delete_user_200_ok
Cenário: [DELETE] Deletar um usario existente
    Dado possuir um novo usuario cadastrado
    Quando realizar uma chamada delete para a rota "/usarios"
    Então validar que o usario foi excluido com sucesso

@delete_user_200_nok
Cenário: [DELETE] Tentar excluir um usuário inexistente
    Dado que possua um usario inexistente
    Quando realizar uma chamada delete para a rota "/usarios"
    Então validar que não e possivel exluir o usario inexistente
