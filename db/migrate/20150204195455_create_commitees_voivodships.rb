class CreateCommiteesVoivodships < ActiveRecord::Migration
  def change
    create_table :commitees_voivodships do |t|
      t.integer :commitee_id
      t.integer :voivodship_id

      t.timestamps null: false
    end
  end
end
