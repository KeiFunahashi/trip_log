class AddTripRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :trip, foreign_key: true
  end
end
