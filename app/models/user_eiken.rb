class UserEiken < ApplicationRecord
  belongs_to :user
  
  enum eiken: {５級:0, ４級:1, ３級:2, 準２級:3, ２級:4, 準１級:5, １級:6}
end
