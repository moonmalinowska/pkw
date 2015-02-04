class CreateCampaignCommiteesVoivodships < ActiveRecord::Migration
  def change
    create_table :campaign_commitees_voivodships do |t|
      t.integer :campaign_commitee_id
      t.integer :voivodship_id

      t.timestamps null: false
    end
  end
end
