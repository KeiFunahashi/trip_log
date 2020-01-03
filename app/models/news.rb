class News < ApplicationRecord
  mount_uploader :newsimage, ImagesUploader
end
