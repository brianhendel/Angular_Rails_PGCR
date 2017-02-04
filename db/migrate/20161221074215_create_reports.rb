class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :activityId, limit: 8
      t.string :mainGt
      
      t.timestamps
    end
  end
end
