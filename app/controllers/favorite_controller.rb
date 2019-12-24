class FavoriteController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @relationships = Relationship.where(user_id:current_user.id)
  end
end
