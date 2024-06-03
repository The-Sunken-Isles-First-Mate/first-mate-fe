class BackendService			
  def self.call_db(url)		
    response = connection.get(url) do |request| 			
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    # td: replace with hosted database once established
    Faraday.new('http://localhost:3000/')		
  end
end