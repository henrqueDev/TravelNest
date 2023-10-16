module HotelsHelper
    def evaluation_description(evaluation)
        case evaluation
        when 0.0..1.999999999
            "Muito Ruim"
        when 2.0..5.999999999
            "Ruim"
        when 6.0..6.999999999
            "Razoavel"
        when 7.0..7.999999999
            "Bom"
        when 8.0..8.999999999
            "Muito Bom"
        when 9.0..10.0
            "Extraordinário"
        else
            "Null"
        end
    end
end
