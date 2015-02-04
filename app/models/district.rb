class District < ActiveRecord::Base
  has_many :votes
  belongs_to :voivodship
  belongs_to :user

  validates :electorate, numericality: true
  validates :mandate, numericality: true
  validates :invalid_vote, numericality: true
  validates :empty_vote, numericality: true
  validates :other_vote, numericality: true
  validates :issued_voting_card, numericality: true

  def valid_votes
    total = self.votes.inject(0){|s,v| s + v.vote }
  end
end