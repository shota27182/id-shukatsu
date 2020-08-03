class Article < ApplicationRecord
    has_many :article_tags
    has_many :tags, through: :article_tags
    
    mount_uploader :img, CompanyImageUploader
end
