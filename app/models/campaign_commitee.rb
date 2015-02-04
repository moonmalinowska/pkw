class CampaignCommitee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodships

  validates :name, presence: true, length: {within: 2..50}
  validates :party, presence: true, length: {within: 2..50}

end
