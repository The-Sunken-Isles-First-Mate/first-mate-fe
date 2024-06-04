class Character
  attr_reader :id,
              :name,
              :user_id,
              :race,
              :class,
              :image_url

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @user_id = data[:user_id]
    @race = data[:race]
    @class = data[:class]
    @image_url = data[:image_url]
  end
end