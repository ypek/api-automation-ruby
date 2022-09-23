# language: pt
@regression
@delete_users
Funcionalidade: Delete usuários
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@delete_user_200_ok
Cenário: [DELETE] Deletar um usario existente
    Dado possuir um novo usuario cadastrado
    Quando realizar uma chamada delete para a rota "/usuarios"
    #Então validar que o usario foi excluido com sucesso
    Então Validar que foi retornado o status code 200 e o schema "Registro excluído com sucesso"

@delete_user_200_nok
Cenário: [DELETE] Tentar excluir um usuário inexistente
    Dado possuir um id de usuario "usuario_invalido"
    Quando realizar uma chamada delete para a rota "/usuarios"
    #Então validar que não e possivel exluir o usario inexistente
    Então Validar que foi retornado o status code 200 e o schema "Nenhum registro excluído"
