class FixManyToMany < ActiveRecord::Migration
  def change
    drop_table :commitees_voivodships
    create_table :commitees_voivodships, id: false do |t|
      t.integer :commitee_id, null: false
      t.integer :voivodship_id, null: false
    end
    add_index :commitees_voivodships, [:commitee_id, :voivodship_id]
  end
end