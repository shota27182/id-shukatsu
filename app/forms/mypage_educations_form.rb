class MypageEducationsForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :highschool, :string
    attribute :seminar, :string
    
    validates :highschool, presence: true

  def save
      raise ActiveRecord::RecordInvalid if invalid?
      ActiveRecord::Base.transaction do
        user = User.find(user_id)
        user.education.update(highschool: highschool, seminar: seminar)
      end
  end
  

end