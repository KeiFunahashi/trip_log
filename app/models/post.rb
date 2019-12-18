class Post < ApplicationRecord
# belongs_to :user
has_many :bookmarks
has_many :users, through: :bookmarks
belongs_to :user
belongs_to :post

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
    Post.where('text LIKE(?)', "%#{search}%")
    Post.where('place LIKE(?)', "%#{search}%")
    Post.where('time LIKE(?)', "%#{search}%")
    end
  end