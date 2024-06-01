class User < ApplicationRecord
  # Validations
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # Class method to find or create a user from OAuth data
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end
end
