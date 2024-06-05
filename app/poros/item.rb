class Item
  attr_reader :name, :quantity

  def initialize(attributes)
    @name = attributes[:name]
    @quantity = attributes[:quantity]
  end
end
