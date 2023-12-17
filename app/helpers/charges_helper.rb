module ChargesHelper
    
    require 'httparty'

    def get_all(user)
        req = HTTParty.get("http://127.0.0.1:5000/consultaPagamentos?user_id=#{user.id}")
        return req[:logs]
    end
        
end