require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it "return valid user when all fields are filled correctly" do
      @user = User.new(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321")

      expect(@user.save).to be_truthy
    end

    it 'error when email is not unique' do 
      @user1 = User.new(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321").save
      @user2 = User.new(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321").save

      expect(@user2).to eq(false)
    end 
 
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'Allow signup and login of account when full credentials are given' do
      @user = User.create(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321")
      @signup = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to eq(@signup)
    end 

    it 'Allow login with white space email credentials' do 
      @user = User.create(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321") 
      @login = User.authenticate_with_credentials(' jacob@gmail.com', @user.password)
      expect(@user).to eq(@login)
    end

    it 'Allow login with different case email credentials' do 
      @user = User.create(first_name: 'jacob', last_name: 'zuma', email: 'jacob@gmail.com', password: '4321', password_confirmation: "4321")
      @login = User.authenticate_with_credentials('Jacob@Gmail.com', @user.password)
      expect(@user).to eq(@login)
    end
  end
end
