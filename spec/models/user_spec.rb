require 'spec_helper'

describe User do
  before do
    @user = User.new({
      email: 'pnavasard@gmail.com',
      password: '123456',
      first_name: 'Paul',
      last_name: 'Navasard'
    })
  end

  it 'should create a UUID new a new user in initialized' do
    @user.id.wont_be_empty
  end

  it 'should authenticate' do
    @user.authenticate('pnavasard@gmail.com', '123456').must_equal true
  end

  it 'should create a hash when a password is set' do
    @user.password.must_be_kind_of BCrypt::Password
    @user.password_hash.must_be_kind_of BCrypt::Password
  end
end
