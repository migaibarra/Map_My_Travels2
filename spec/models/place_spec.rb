require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:example_place) { Place.new({
    name: "Portland",
    state_province: "Maine",
    country: "United States"
    })
  }

  describe "Validations" do

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

  describe "Associations" do
    let(:user_example) do
      user_creation = User.new(
        first_name: "Jacob",
        middle_initial: "A",
        last_name: "Sanders",
        email: "j.a.sanders@example.com",
        password: "Pa$$w0rd"
      )

      user_creation.password
      user_creation.save!
      return user_creation
    end

    it 'can be associated with a user' do
      example_place.users << user_example
      expect(example_place.users).to include user_example
    end
  end
end
