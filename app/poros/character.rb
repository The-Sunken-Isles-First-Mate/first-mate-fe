class Character
  attr_reader :id,
              :name,
              :user_id,
              :dnd_race,
              :dnd_class,
              :image_url

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @user_id = data[:user_id]
    @dnd_race = data[:dnd_race]
    @dnd_class = data[:dnd_class]
    @image_url = data[:image_url]
  end
end