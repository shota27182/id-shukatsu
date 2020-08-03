class Article < ApplicationRecord
    mount_uploader :img, CompanyImageUploader
end
