class MypageEducationsForm
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Enum
    
    

    attribute :user_id, :integer
    attribute :highschool, :string
    attribute :seminar, :string
    attribute :university, :string
    attribute :department, :string
    attribute :faculty, :string
    attribute :classification, :string
    attribute :grade_id, :integer
    
    
    validates :highschool, presence: true
    validates :seminar, presence: true
    validates :university, presence: true
    validates :department, presence: true
    validates :faculty, presence: true
    

  def save
      return false if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        if !user.education.present?
          user.build_education
        end
        user.education.update(highschool: highschool, seminar: seminar, university: university, department: department, faculty: faculty, grade_id: grade_id, classification: classification)
      end
  end
  

end