class MypageGeneralsForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :company_id, :integer
    attribute :man, :integer
    attribute :woman, :integer
    attribute :humanity_man, :integer
    attribute :humanity_woman, :integer
    attribute :science_man, :integer
    attribute :science_woman, :integer
    attribute :work_duration, :integer
    attribute :overtime, :integer
    attribute :holiday_use, :integer
    
    validates :address1, presence: true
    validates :address2, presence: true
    validates :tel, presence: true
    validates :name, presence: true
    validates :kana, presence: true
    validates :sex, presence: true

  def save
      return false if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        if !user.general.present?
          user.build_general
        end
        user.update(name: name, kana: kana)
        user.general.update(address1: address1, address2: address2, building_name: building_name, tel: tel,birthday: birthday, sex: sex)
      end
  end
  

end