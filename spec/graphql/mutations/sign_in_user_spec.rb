require 'rails_helper'

RSpec.describe 'SignInUser' do
  let(:user) {
    User.create!(first_name: 'Charles', email: 'charles@test.com', password: '12345678')
  }

  it 'signs in a given user' do
    args = {
      credentials: {
        email: user.email,
        password: '12345678'
      }
    }

    result = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)

    expect(result[:token]).not_to be_nil
    expect(result[:user]).to eq(user)
  end

  it 'fails to sign in if email is incorrect' do
    args = {
      credentials: {
        email: 'incorrect_email@test.com',
        password: '12345678'
      }
    }

    result = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)

    expect(result).to be_nil
  end

  it 'fails to sign in if password is incorrect' do
    args = {
      credentials: {
        email: user.email,
        password: 'wrong_password'
      }
    }

    result = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)

    expect(result).to be_nil
  end

  it 'fails if no credentials are given' do
    result = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve()

    expect(result).to be_nil
  end
end