class MypageMailForm
    
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Enum
    
    attribute :user_id, :integer
    attribute :magazine, :integer
    attribute :scout, :integer
    
    enum magazine: { メールで受け取る: 1, 受け取らない: 2 }
    enum scout: { メールで受け取る: 1, 受け取らない: 2 }
    
    validates :magazine, presence: true
    validates :scout, presence: true
    

  def save
      
      return false if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        user.user_receive.update(magazine: magazine, scout: scout)
      end
  end
  

end