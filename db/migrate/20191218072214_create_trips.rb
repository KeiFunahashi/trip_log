class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string    :title, null: false
      t.string    :prefecture, null: false 
      t.timestamps
      t.references    :user, foreign_key: true
    end
  end
end
