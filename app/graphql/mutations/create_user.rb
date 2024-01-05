module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: true
    end

    argument :first_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: true

    type Types::UserType

    def resolve(first_name: nil, auth_provider: nil)
      User.create!(
        first_name: first_name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password),
      )
    end
  end
end