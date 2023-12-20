# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Database schema' do
    it 'creates users table with necessary columns' do
      expect(User.column_names).to include('email', 'username', 'cpf', 'encrypted_password', 'reset_password_token', 'reset_password_sent_at', 'remember_created_at', 'user_type')
    end

    it 'creates unique index for email' do
      expect(ActiveRecord::Base.connection.index_exists?(:users, :email, unique: true)).to be_truthy
    end

    it 'creates unique index for reset_password_token' do
      expect(ActiveRecord::Base.connection.index_exists?(:users, :reset_password_token, unique: true)).to be_truthy
    end
  end

  describe 'User creation' do
    it 'creates two different users in the test database' do

      user1 = User.create(email: 'user2@example.com', username: 'user1', cpf: '11111111111', password: 'password1', user_type: 0)
      user2 = User.create(email: 'user3@example.com', username: 'user2', cpf: '22222222222', password: 'password2', user_type: 1)
      user1.save
      user2.save
      expect(User.count).to eq(3)
      expect(user1).to be_valid
      expect(user2).to be_valid
    end
  end
end
