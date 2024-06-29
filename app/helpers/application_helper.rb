module ApplicationHelper
  def dnd_races
    [
      "Aarakocra", "Aasimar", "Bugbear", "Decapodian", "Dragonborn", "Drow", "Dwarf", "Elf", "Eladrin",
      "Firbolg", "Genasi", "Gnome", "Goblin", "Goliath", "Half-Elf", "Half-Orc", "Halfling",
      "Hobgoblin", "Human", "Kia'i", "Kenku", "Kobold", "Lizardfolk", "Mant-i", "Mirescale", "Orc",
      "Svirfneblin", "Tabaxi", "Tiefling", "Triton", "Yuan-Ti Pureblood"
    ]
  end

  def dnd_classes
    [
      "Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", 
      "Sorcerer", "Warlock", "Wizard"
    ]
  end

  def villager_distribution_info
    "Note: Villagers can only be sent out in groups of 10.  You do not need to distribute all villagers, but cannot allocate more villagers than you have available for expeditions."
  end

  def item_crafting_info
    "Note: Only 1 of each item may be crafted per week.  There must be enough current resources to construct each item on its own. Please reference the campaign guide for crafting resource costs."
  end
end
