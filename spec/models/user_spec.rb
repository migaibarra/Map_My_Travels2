require 'rails_helper'

RSpec.describe User, type: :model do
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

  describe "Validations" do
    it 'is not valid without a first_name' do
      user_example.first_name = ''
      expect(user_example).to_not be_valid
    end

    it 'is not valid without a last_name' do
      user_example.last_name = ''
      expect(user_example).to_not be_valid
    end

    it 'is not valid without an email' do
      user_example.email = ''
      expect(user_example).to_not be_valid
    end

    it 'is not valid if email is not properly formated' do
      user_example.email = 'j.a.example.com'
      expect(user_example).to_not be_valid
    end

    it 'is not valid if the email is a duplicate' do
      user_example.save
      user_duplicate = User.new(
        first_name: "Jason",
        middle_initial: "A",
        last_name: "Sanders",
        email: "j.a.sanders@example.com",
        password: "Nothing2"
      )
      expect(user_duplicate).to_not be_valid
    end

    it 'is not valid without a password_hash' do
      user_example.password_hash = ""
      expect(user_example).to_not be_valid
    end

    it 'is valid with all fields inputed' do
      expect(user_example).to be_valid
    end
  end

  describe "Associations" do
    let(:place_example1) { Place.new({
        name: "Paris",
        state_province: "Texas",
        country: "United States"
      })
    }

    let(:place_example2) { Place.new({
        name: "Paris",
        state_province: "",
        country: "France"
      })
    }

    it 'can be associated with a place (as a place visited)' do
      user_example.save
      user_example.places << place_example1
      expect(user_example.places).to include place_example1
    end

    it 'can be associated with multiple places (as a place visited)' do
      user_example.save
      user_example.places << place_example1
      user_example.places << place_example2
      expect(user_example.places).to eq [place_example1, place_example2]
    end
  end
end
