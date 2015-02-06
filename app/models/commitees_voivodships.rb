class CommiteesVoivodships < ActiveRecord::Base
  belongs_to :commitee
  belongs_to :voivodship
end
