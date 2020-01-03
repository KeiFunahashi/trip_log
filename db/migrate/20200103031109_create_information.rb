class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.text :infimage, null: false
      t.text :inftitle, null: false
      t.text :inftext, null: false
      t.text :prefecture, null: false
      t.timestamps
    end
  end
end
