class CampaignCommiteesVoivodship < ActiveRecord::Base
  belongs_to :campaign_commitee
  belongs_to :voivodship
end
