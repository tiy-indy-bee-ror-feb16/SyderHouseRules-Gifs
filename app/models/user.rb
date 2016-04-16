class User < ActiveRecord::Base
  has_secure_password

  has_many :gifs, dependent: :destroy

  validates :username, :email, :bio, :password, presence: true
  validates :username, length: {
                                minimum: 6,
                                too_short: "Username must be at least 6 characters",
                                maximum: 25,
                                too_long: "Username must be less than 25 characters"
                                }
  validates :password, length: {
                                minimum: 8,
                                too_short: "Password must be at least 6 characters",
                                maximum: 25,
                                too_long: "Password must be less than 25 characters"
                                }
  validates :username, :email, uniqueness: true
  validate :email_is_valid_format
  before_validation :downcase_email, :downcase_username
  before_save :set_default_avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  private

  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def downcase_email
    email.downcase! if email
  end

  def downcase_username
    username.downcase! if username
  end

  def set_default_avatar
     self.avatar ||= "https://unsplash.it/400/?image=1061"
  end

end
