class User < ApplicationRecord
  enum role: %w[undecided dungeon_master player]
end
