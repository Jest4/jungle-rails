class User < ActiveRecord::Base

  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { in: 4..20 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
  end

end
