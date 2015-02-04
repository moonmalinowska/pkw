class Vote < ActiveRecord::Base
  belongs_to :district
  belongs_to :campaign_commitee

  validates :vote, numericality: true
end
