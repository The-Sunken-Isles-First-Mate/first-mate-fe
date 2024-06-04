class Pl
  attr_reader :id,
              :campaign_id

  def initialize(data)
    @id = data[:id]
    @campaign_id = data[:campaign_id]
  end
end