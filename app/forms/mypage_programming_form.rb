class MypageProgrammingForm
    include ActiveModel::Model
    include ActiveModel::Attributes
    
    attr_accessor :mypage_user_programmings

    attribute :user_id, :integer
    attribute :programming_id, :integer
    attribute :use_time, :string
    attribute :description, :string
    
    validates :address1, presence: true
    validates :address2, presence: true
    validates :building_name, presence: true
    validates :tel, presence: true

  def save
      raise ActiveRecord::RecordInvalid if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        if !user.general.present?
          user.user_programmings.builds
        end
        user.update(name: name)
        user.general.update(address1: address1, address2: address2, building_name: building_name, tel: tel,birthday: birthday)
      end
  end
  

end