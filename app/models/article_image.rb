class ArticleImage < ApplicationRecord
  mount_uploader :image, CompanyImageUploader
end
