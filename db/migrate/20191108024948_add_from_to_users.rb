class AddFromToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :from, :string
  end
end
