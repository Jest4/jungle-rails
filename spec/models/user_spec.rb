require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it 'should successfully save' do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'name'
      @user.email = 'some@email.com'
      @user.password = 'testpass'
      @user.password_confirmation = 'testpass'
      expect(@user.save).to be true
    end

    it 'should have a first name' do
      @user = User.new
      @user.last_name = 'name'
      @user.email = 'some@email.com'
      @user.password = 'testpass'
      @user.password_confirmation = 'testpass'
      expect(@user.save).to be false
    end

    it 'should have a last name' do
      @user = User.new
      @user.first_name = 'test'
      @user.email = 'some@email.com'
      @user.password = 'testpass'
      @user.password_confirmation = 'testpass'
      expect(@user.save).to be false
    end

    it 'should have an email' do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'name'
      @user.password = 'testpass'
      @user.password_confirmation = 'testpass'
      expect(@user.save).to be false
    end

    it 'should have a password' do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'name'
      @user.email = 'some@email.com'
      @user.password_confirmation = 'testpass'
      expect(@user.save).to be false
    end

    it 'should have a password confirmation' do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'name'
      @user.email = 'some@email.com'
      @user.password = 'testpass'
      expect(@user.save).to be false
    end

    it 'password confirmation should match password' do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'name'
      @user.email = 'some@email.com'
      @user.password = 'testpass'
      @user.password_confirmation = 'nottestpass'
      expect(@user.save).to be false
    end



  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before :all do
      @user = User.create(first_name: 'test', last_name: 'name', email: 'some@example.com', password: 'testpass', password_confirmation: 'testpass')
    end

    it 'should successfully login' do
      expect(User.authenticate_with_credentials('some@example.com', 'testpass')).to eq User.find_by_email('some@example.com')
    end

    it 'should strip whitespace from login email' do
      expect(User.authenticate_with_credentials('    some@example.com    ', 'testpass')).to eq User.find_by_email('some@example.com')
    end

    it 'should strip downcase login email' do
      expect(User.authenticate_with_credentials('sOMe@example.COM', 'testpass')).to eq User.find_by_email('some@example.com')
    end


  end

end
