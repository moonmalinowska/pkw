class CreateCommitees < ActiveRecord::Migration
  def change
    create_table :commitees do |t|
        t.string :name
        t.text :logo
        t.string :party
        t.timestamps null: false
      end
    end
  end

