class Vote < ActiveRecord::Base
  belongs_to :district,:class_name => "District", :foreign_key => "district_id"
  belongs_to :commitee, :class_name => "Commitee", :foreign_key => "commitee_id"

  validates :vote, numericality: true

   def district_name
    # district_name = self.district.name
     district = self.districts.name
   end

  def commitee_name
     commitee_name = self.commitee.name
  end
  end
