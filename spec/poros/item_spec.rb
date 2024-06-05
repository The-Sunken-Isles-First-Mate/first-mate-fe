require 'rails_helper'

RSpec.describe Item do
  it 'exists and has attributes' do
    item = Item.new({
      name: "Random Item",
      quantity: 10
    })

    expect(item).to be_a(Item)
    expect(item.name).to eq("Random Item")
    expect(item.quantity).to eq(10)
  end
end
