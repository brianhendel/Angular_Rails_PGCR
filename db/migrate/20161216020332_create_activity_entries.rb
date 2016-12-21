class CreateActivityEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_entries do |t|
      t.string :gamertag
      t.integer :score
      t.integer :kills
      t.integer :deaths
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
