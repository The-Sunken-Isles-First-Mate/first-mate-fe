class CharsAttr 
  attr_reader :classes,
              :races
  
  def initialize(data)
    @classes = data['classes'].map { |c| c[:name] }
    @races   = data['races'].map { |c| c[:name] }
  end
end