require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
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
  end
end
