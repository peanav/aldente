require 'spec_helper'

describe User do
  before do
    @user = User.new({
      email: 'pnavasard@gmail.com',
      password: '123456'
    })

  end
  it 'should authenticate' do
    @user.authenticate('pnavasard@gmail.com', '123456').must_equal true
  end

  it 'should create a hash when a password is set' do
    @user.password_hash.must_be_kind_of BCrypt::Password
  end
end
