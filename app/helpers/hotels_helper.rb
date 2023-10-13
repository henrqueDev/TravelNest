module HotelsHelper
    def evaluation_description(evaluation)
        case evaluation
        when 0..1.999999999
            "Muito Ruim"
        when 2..5.999999999
            "Ruim"
        when 6..6.999999999
            "Razoavel"
        when 7..7.999999999
            "Bom"
        when 8..8.999999999
            "Muito bom"
        when 9..10
            "Extraordinário"
        else
            "You gave me #{evaluation} -- I have no idea what to do with that."
        end
    end
end
