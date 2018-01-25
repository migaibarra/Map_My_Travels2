require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "Validations" do
    let(:example_place) { Place.new({
        name: "Portland",
        state_province: "Maine",
        country: "United States"
      })
    }

    it 'is not valid without a city/town name' do
      example_place.name = ""
      expect(example_place).to_not be_valid
    end

    it 'is not valid without a country' do
      example_place.country = ""
      expect(example_place).to_not be_valid
    end

    it 'is valid without a state/province' do
      example_place.state_province = ""
      expect(example_place).to be_valid
    end

    it 'is valid with a name, state/province and country' do
      expect(example_place).to be_valid
    end
  end
end
