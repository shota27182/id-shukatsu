class UserReceive < ApplicationRecord
    belongs_to :user
    
    enum magazine:{メールで受け取る: 1, 受け取らない:2}, _prefix: :from
    enum scout:{メールで受け取る:1,受け取らない:2}, _prefix: :dest
end
