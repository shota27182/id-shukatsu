class EventImage < ApplicationRecord
  belongs_to :event
  mount_uploader :image, EventImageUploader
end
