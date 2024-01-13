require 'rails_helper'

RSpec.describe 'CreateBlog' do
  let(:user) {
    User.create!(first_name: 'Charles', email: 'charles@test.com', password: '12345678')
  }

  it 'creates a blog if user is authenticated/present in the context' do
    context = { current_user: user }
    args = {
      title: 'Ilhabela',
      description: 'beautiful place'
    }

    result = Mutations::CreateBlog.new(object: nil, field: nil, context: context).resolve(**args)

    expect(result[:id]).not_to be_nil
    expect(result[:title]).to eq('Ilhabela')
    expect(result[:description]).to eq('beautiful place')
  end

  it 'does not create a blog id current_user is present in context' do
    args = {
      title: 'Ilhabela',
      description: 'beautiful place'
    }

    expect {
      Mutations::CreateBlog.new(object: nil, field: nil, context: {}).resolve(**args)
  }.to raise_error(ActiveRecord::RecordInvalid)
  end
end