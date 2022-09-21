

module Factory
    class Dynamic
        def self.new_valid_user(user_type = nil)
            payload ={
                "nome": Faker::Name.name,
                "email": Faker::Internet.email,
                "password": "teste",
                "administrador": "true",
            }
            return payload if user_type.nil?
            
            if user_type == 'usuario_admin'
                payload['administrador'] = 'true'
            elsif user_type == 'usuario_nao_admin'
                payload['administrador'] = 'false'
            end
            payload
        end

        
        def self.invalid_user
            @id = "invalido"
          
        end
        
        def self.new_valid_product
            {
                "nome": Faker::Commerce.product_name,
                "preco": 470,
                "descricao": Faker::Lorem.paragraph,
                "quantidade": 777
            }
        end
    end
end


