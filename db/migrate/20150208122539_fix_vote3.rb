class FixVote3 < ActiveRecord::Migration
  def change
    change_column :votes, :vote, :integer, null: false, default: 0
  end
end
