class Commitee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodships, join_table: :commitees_voivodships
  accepts_nested_attributes_for :voivodships

  validates :name, presence: true, length: {within: 2..50}
  validates :party, presence: true, length: {within: 2..50}
end
