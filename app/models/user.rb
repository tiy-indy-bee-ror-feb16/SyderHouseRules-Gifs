class User < ActiveRecord::Base
  has_secure_password

  has_many :gifs

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
  before_validation :downcase_email
  before_save :set_default_avatar

  private

  def email_is_valid_format
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def downcase_email
    email.downcase!
  end

  def set_default_avatar
     self.avatar ||= "https://unsplash.it/400/?image=1061"
  end

end
