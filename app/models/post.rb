class Post < ApplicationRecord
# belongs_to :user
has_many :bookmarks
has_many :users, through: :bookmarks
belongs_to :user

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
    end
  end