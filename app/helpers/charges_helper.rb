module ChargesHelper
    
    require 'httparty'

    def get_all(user)
        req = HTTParty.get("http://127.0.0.1:5000/consultaPagamentos?user_id=#{user.id}")
        json_data = nil
        if req.success?
            json_data = JSON.parse(req.body)
        else
            return "Erro na requisição: #{req.code}"
        end
        return json_data['logs']
    end
        
end