require 'rails_helper'

RSpec.describe User do
  it 'exists and has attributes' do
    user = User.new({
      id: 5,
      uid: 10,
      username: 'coolusername'
    })

    expect(user).to be_a(User)
    expect(user.id).to eq(5)
    expect(user.uid).to eq(10)
    expect(user.username).to eq('coolusername')
  end
end
