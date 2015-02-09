class District < ActiveRecord::Base
  has_many :votes
  belongs_to :voivodship, :class_name => "Voivodship", :foreign_key => "voivodship_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  validates :electorate, numericality: true
  validates :mandate, numericality: true
  validates :invalid_vote, numericality: true
  validates :empty_vote, numericality: true
  validates :other_vote, numericality: true
  validates :issued_voting_card, numericality: true

  def set_district
    @district = District.find(params[:id])
  end

  def valid_votes
    valid = self.votes.inject(0){|s,v| s + v.vote }
  end

  def invalid_votes
    invalid = self.invalid_vote + self.empty_vote + self.other_vote
  end

   def total
     total = self.valid_votes + self.invalid_votes
   end

   def cards
     if self.issued_voting_card == self.total
       cards = "Liczba kart się zgadza"
     else
       cards = self.issued_voting_card - self.total
     end

   end

   def by_id
     current_district= (@districts.where(user_id: current_user))
     by_id = self.voivodship_id
        end





  end

