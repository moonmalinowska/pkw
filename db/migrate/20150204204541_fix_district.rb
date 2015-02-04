class FixDistrict < ActiveRecord::Migration
  def change
    add_column :districts, :user_id, :integer
    add_column :districts, :voivodship_id, :integer
  end
end
