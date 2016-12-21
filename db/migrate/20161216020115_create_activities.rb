class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :activityId
      t.integer :mode
      t.integer :mainScore
      t.integer :mainKills
      t.integer :mainDeaths
      t.string :mainStanding

      t.timestamps
    end
  end
end
