class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :gamertag
      t.integer :memberId, limit: 8
      t.integer :charId_1, limit: 8
      t.integer :charId_2, limit: 8
      t.integer :charId_3, limit: 8


      t.timestamps
    end
  end
end
