class Gif < ActiveRecord::Base
  acts_as_voteable
  acts_as_taggable
  paginates_per 30
  belongs_to :user
  validates :url, :description, presence: true
  validates :url, length: { minimum: 12, too_short: "not long enough" }
  validates :url, uniqueness: true
  validates :url, format: { with: /\Ahttps?:\/\// }
  validates :url, format: { with: /.gif\Z/ }

end
