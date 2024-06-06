class DndFacade 
  def self.get_attrs
    attrs = {}
    catgs = ['classes', 'races']
    catgs.each { |a| attrs[a] = DndService.call_db(a)[:results] }
    CharsAttr.new(attrs)
  end
end