class Voivodship < ActiveRecord::Base
  has_many :districts
  has_and_belongs_to_many :commitees, join_table: :commitees_voivodships
  accepts_nested_attributes_for :commitees

  validates :name, presence: true, length: {within: 7..50},
            confirmation: {
                message: "Wpisz poprawne województwo"
            }
end
