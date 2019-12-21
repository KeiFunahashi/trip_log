class Post < ApplicationRecord
# belongs_to :user
has_many :bookmarks
has_many :users, through: :bookmarks
belongs_to :user, optional: true
belongs_to :trip, inverse_of: :posts, optional: true
mount_uploader :image, ImagesUploader
  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
    Post.where('text LIKE(?)', "%#{search}%")
    Post.where('place LIKE(?)', "%#{search}%")
    Post.where('time LIKE(?)', "%#{search}%")
    end
  end