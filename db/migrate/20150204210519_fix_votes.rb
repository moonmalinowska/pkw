class FixVotes < ActiveRecord::Migration
  def change
    add_column :votes, :campaign_commitee_id, :integer
    add_column :votes, :district_id, :integer
  end
end
