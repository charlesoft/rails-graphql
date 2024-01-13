module Mutations
  class SignInUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by_email(credentials[:email])

      return unless user and user.authenticate(credentials[:password])

      encryptor = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      auth_token = encryptor.encrypt_and_sign("user-id:#{user.id}")
      context[:session][:token] = auth_token

      {
        user: user,
        token: auth_token
      }
    end
  end
end