require 'rails_helper'
require_relative '../../app/helpers/hotels_helper'

RSpec.describe HotelsHelper do
    describe "evaluation" do
        it "should return 'Muito Ruim'" do
            text = helper.evaluation_description(1.2)
            expect(text).to eq "Muito Ruim"
        end
        it "should return 'Ruim'" do
            text = helper.evaluation_description(3.2)
            expect(text).to eq "Ruim"
        end
        it "should return 'Razoavel'" do
            text = helper.evaluation_description(6.2)
            expect(text).to eq "Razoavel"
        end
        it "should return 'Bom'" do
            text = helper.evaluation_description(7.2)
            expect(text).to eq "Bom"
        end
        it "should return 'Muito Bom'" do
            text = helper.evaluation_description(8.2)
            expect(text).to eq "Muito Bom"
        end
        it "should return 'Extraordinário'" do
            text = helper.evaluation_description(9.8)
            expect(text).to eq "Extraordinário"
        end
    end
end