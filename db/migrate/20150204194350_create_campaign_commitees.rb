class CreateCampaignCommitees < ActiveRecord::Migration
  def change
    create_table :campaign_commitees do |t|
      t.string :name
      t.text :logo
      t.string :party

      t.timestamps null: false
    end
  end
end
