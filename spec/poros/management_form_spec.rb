require 'rails_helper'

RSpec.describe ManagementForm do
  it 'exists and has attributes' do
    management_form = ManagementForm.new({
      id: "123",
      week: 0,
      animal_products: 0,
      cloth: 0,
      farmed_goods: 0,
      food: 0,
      foraged_goods: 0,
      metal: 0,
      monster_parts: 0,
      stone: 0,
      wood: 0,
      light_armor: 0,
      medium_armor: 0,
      heavy_armor: 0,
      simple_weapon: 0,
      martial_weapon: 0,
      ammunition: 0,
      adventuring_supplies: 0,
      assassins_blood: 0,
      malice: 0,
      midnight_tears: 0,
      serpent_venom: 0,
      truth_serum: 0,
      oil_of_slipperiness: 0,
      potion_of_climbing: 0,
      potion_of_healing: 0,
      potion_of_water_breathing: 0,
      barge: 0,
      coracle: 0,
      double_hulled_sailing_canoe: 0,
      keelboat: 0,
      raft: 0,
      single_hulled_sailing_canoe: 0,
      ballista: 0,
      cabin: 0,
      magical_defenses: 0,
      storage: 0
    })

    expect(management_form).to be_a(ManagementForm)
    expect(management_form.id).to eq("123")
    expect(management_form.week).to eq(0)
    expect(management_form.animal_products).to eq(0)
    expect(management_form.cloth).to eq(0)
    expect(management_form.farmed_goods).to eq(0)
    expect(management_form.food).to eq(0)
    expect(management_form.foraged_goods).to eq(0)
    expect(management_form.metal).to eq(0)
    expect(management_form.monster_parts).to eq(0)
    expect(management_form.stone).to eq(0)
    expect(management_form.wood).to eq(0)
    expect(management_form.light_armor).to eq(0)
    expect(management_form.medium_armor).to eq(0)
    expect(management_form.heavy_armor).to eq(0)
    expect(management_form.simple_weapon).to eq(0)
    expect(management_form.martial_weapon).to eq(0)
    expect(management_form.ammunition).to eq(0)
    expect(management_form.adventuring_supplies).to eq(0)
    expect(management_form.assassins_blood).to eq(0)
    expect(management_form.malice).to eq(0)
    expect(management_form.midnight_tears).to eq(0)
    expect(management_form.serpent_venom).to eq(0)
    expect(management_form.truth_serum).to eq(0)
    expect(management_form.oil_of_slipperiness).to eq(0)
    expect(management_form.potion_of_climbing).to eq(0)
    expect(management_form.potion_of_healing).to eq(0)
    expect(management_form.potion_of_water_breathing).to eq(0)
    expect(management_form.barge).to eq(0)
    expect(management_form.coracle).to eq(0)
    expect(management_form.double_hulled_sailing_canoe).to eq(0)
    expect(management_form.keelboat).to eq(0)
    expect(management_form.raft).to eq(0)
    expect(management_form.single_hulled_sailing_canoe).to eq(0)
    expect(management_form.ballista).to eq(0)
    expect(management_form.cabin).to eq(0)
    expect(management_form.magical_defenses).to eq(0)
    expect(management_form.storage).to eq(0)
  end
end