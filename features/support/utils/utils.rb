class Utils
    def self.log_response(verebo, endpoint, body)
         "Retorno da chamada com #{verebo} para #{endpoint}:\n#{body}"
    end
    
    def self.get_schema(schema)
       _schema = JSON.parse(File.read(%-#{Dir.pwd}/features/support/utils/schemas/#{schema}.json-))
    end

end
