

module Factory
    class Dynamic
        def self.new_valid_user
            {
                "nome": Faker::Name.name,
                "email": Faker::Internet.email,
                "password": "teste",
                "administrador": "true",
            }
        end
    end
end 
