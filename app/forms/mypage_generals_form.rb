class MypageGeneralsForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :name, :string
    attribute :kana, :string
    attribute :address1, :string
    attribute :address2, :string
    attribute :building_name, :string
    attribute :tel, :string
    attribute :birthday, :date
    attribute 'birthday(1i)' 
    attribute 'birthday(2i)'
    attribute 'birthday(3i)'
    
    validates :address1, presence: true
    validates :address2, presence: true
    validates :building_name, presence: true
    validates :tel, presence: true

  def save
      raise ActiveRecord::RecordInvalid if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        if !user.general.present?
          user.build_general
        end
        user.update(name: name)
        user.general.update(address1: address1, address2: address2, building_name: building_name, tel: tel,birthday: birthday)
      end
  end
  

end