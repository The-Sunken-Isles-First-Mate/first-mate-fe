class DndCampaign
  attr_reader :id,
              :name,
              :week,
              :animal_products,
              :cloth,
              :farmed_goods,
              :food,
              :foraged_goods,
              :metal,
              :monster_parts,
              :stone,
              :wood,
              :villagers

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @week = data[:week]
    @animal_products = data[:animal_products]
    @cloth = data[:cloth]
    @farmed_goods = data[:farmed_goods]
    @food = data[:food]
    @foraged_goods = data[:foraged_goods]
    @metal = data[:metal]
    @monster_parts = data[:monster_parts]
    @stone = data[:stone]
    @wood = data[:wood]
    @villagers = data[:villagers]
  end
end