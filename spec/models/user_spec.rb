require 'spec_helper'

describe User do
  before do
    @user = User.new({
      email: 'pnavasard@gmail.com',
      password: '123456'
    })

  end
  it 'should authenticate' do
    p @user
    @user.authenticate('pnavasard@gmail.com', '123456').must_equal true
  end
end
