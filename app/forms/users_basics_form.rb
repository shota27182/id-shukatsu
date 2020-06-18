class UsersBasicsForm
    
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :kana, :string
    attribute :address1, :string
    attribute :address2, :string
    attribute :building_name, :string
    attribute :tel, :string
    attribute :highschool, :string
    attribute :birthday, :date
    attribute 'birthday(1i)' 
    attribute 'birthday(2i)'
    attribute 'birthday(3i)' 

    validates :kana, presence: true
    validates :address1, presence: true
    validates :address2, presence: true
    validates :building_name, presence: true
    validates :tel, presence: true
    validates :highschool, presence: true

  def save
      raise ActiveRecord::RecordInvalid if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        user.build_general(kana: kana, address1: address1, address2: address2, building_name: building_name, tel: tel,birthday: birthday)
        user.build_education(highschool: highschool)
        user.save!
      end
  end
  

end