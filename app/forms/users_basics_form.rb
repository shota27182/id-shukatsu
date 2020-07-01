class UsersBasicsForm
    
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :address1, :string
    attribute :address2, :string
    attribute :building_name, :string
    attribute :tel, :string
    attribute :highschool, :string
    attribute :birthday, :date
    attribute 'birthday(1i)' 
    attribute 'birthday(2i)'
    attribute 'birthday(3i)'
    attribute :sex, :string
    attribute :highschool, :string
    attribute :seminar, :string
    attribute :university, :string
    attribute :department, :string
    attribute :faculty, :string
    attribute :classification, :string
    attribute :grade_id, :integer

    validates :address1, presence: true
    validates :address2, presence: true
    validates :building_name, presence: true
    validates :tel, presence: true
    validates :highschool, presence: true
    validates :highschool, presence: true
    validates :seminar, presence: true
    validates :university, presence: true
    validates :department, presence: true
    validates :faculty, presence: true

  def save
      raise ActiveRecord::RecordInvalid if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        user.build_general(address1: address1, address2: address2, building_name: building_name, tel: tel,birthday: birthday, sex: sex)
        user.build_education(highschool: highschool, seminar: seminar, university: university, department: department, faculty: faculty, grade_id: grade_id, classification: classification)
        user.save!
      end
  end
  

end