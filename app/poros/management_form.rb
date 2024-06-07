class ManagementForm
  attr_reader :id,
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
              :light_armor,
              :medium_armor,
              :heavy_armor,
              :simple_weapon,
              :martial_weapon,
              :ammunition,
              :adventuring_supplies,
              :assassins_blood,
              :malice,
              :midnight_tears,
              :serpent_venom,
              :truth_serum,
              :oil_of_slipperiness,
              :potion_of_climbing,
              :potion_of_healing,
              :potion_of_water_breathing,
              :barge,
              :coracle,
              :double_hulled_sailing_canoe,
              :keelboat,
              :raft,
              :single_hulled_sailing_canoe,
              :ballista,
              :cabin,
              :magical_defenses,
              :storage

  def initialize(data)
    @id = data[:id]
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
    @light_armor = data[:light_armor]
    @medium_armor = data[:medium_armor]
    @heavy_armor = data[:heavy_armor]
    @simple_weapon = data[:simple_weapon]
    @martial_weapon = data[:martial_weapon]
    @ammunition = data[:ammunition]
    @adventuring_supplies = data[:adventuring_supplies]
    @assassins_blood = data[:assassins_blood]
    @malice = data[:malice]
    @midnight_tears = data[:midnight_tears]
    @serpent_venom = data[:serpent_venom]
    @truth_serum = data[:truth_serum]
    @oil_of_slipperiness = data[:oil_of_slipperiness]
    @potion_of_climbing = data[:potion_of_climbing]
    @potion_of_healing = data[:potion_of_healing]
    @potion_of_water_breathing = data[:potion_of_water_breathing]
    @barge = data[:barge]
    @coracle = data[:coracle]
    @double_hulled_sailing_canoe = data[:double_hulled_sailing_canoe]
    @keelboat = data[:keelboat]
    @raft = data[:raft]
    @single_hulled_sailing_canoe = data[:single_hulled_sailing_canoe]
    @ballista = data[:ballista]
    @cabin = data[:cabin]
    @magical_defenses = data[:magical_defenses]
    @storage = data[:storage]
  end
end