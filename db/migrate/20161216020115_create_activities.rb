class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :charId, limit: 8
      t.integer :membership_id, limit: 8
      t.integer :activityId, limit: 8
      t.integer :mode, limit: 8
      t.integer :mainScore, limit: 8
      t.integer :mainKills, limit: 8
      t.integer :mainDeaths, limit: 8
      t.string :mainStanding

      t.timestamps
    end
  end
end
