class User
  attr_reader :id,
              :uid,
              :username

  def initialize(data)
    @id = data["id"]
    @uid = data["uid"]
    @username = data["username"]
  end
end