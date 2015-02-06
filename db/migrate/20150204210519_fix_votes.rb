class FixVotes < ActiveRecord::Migration
  def change
    add_column :votes, :_id, :integer
    add_column :votes, :district_id, :integer
  end
end
