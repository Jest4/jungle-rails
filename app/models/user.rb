class User < ActiveRecord::Base

  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, :password_confirmation, presence: true
  validates :password, length: { in: 4..20 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    # If the user exists AND the password entered is correct.
    cleanemail = email.strip.downcase
    user = User.find_by_email(cleanemail)
    user && user.authenticate(password)
  end

end
