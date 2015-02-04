class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :electorate
      t.integer :mandate
      t.integer :invalid_vote
      t.integer :empty_vote
      t.integer :other_vote
      t.integer :issued_voting_card

      t.timestamps null: false
    end
  end
end
