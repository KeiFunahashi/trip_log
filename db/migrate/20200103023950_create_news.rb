class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.text :newsimage , null: false
      t.string :newstitle , null: false
      t.text :newscontent , null: false
      t.timestamps
    end
  end
end
