class Gif < ActiveRecord::Base
  belongs_to :user
  validates :url, :description, presence: true
  validates :url, length: { minimum: 12, too_short: "not long enough" }
  validates :url, uniqueness: true
  validate :url, format: { with: /\Ahttps?:\/\// }
  validate :url, format: { with: /.gif\Z/ }

end
