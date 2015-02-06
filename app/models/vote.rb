class Vote < ActiveRecord::Base
  belongs_to :district
  belongs_to :commitee

  validates :vote, numericality: true
end
