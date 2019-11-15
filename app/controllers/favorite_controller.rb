class FavoriteController < ApplicationController
  def index
    @relationships = Relationship.where(user_id:current_user.id)
  end
end
