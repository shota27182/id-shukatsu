class MypageWishForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :company_scale_ids, array: :integer
    attribute :industry_ids, array: :integer
    attribute :occupation_ids, array: :integer
    attribute :work_area_ids, array: :integer
    
    validates :company_scale_ids,:length => {:minimum   => 2}
    validates :industry_ids, :length => {:minimum   => 2}
    validates :occupation_ids,:length => {:minimum   => 2}
    validates :work_area_ids,:length => {:minimum   => 2}


  def save
      return false if invalid?
      user = User.find(user_id)
      user.update_attributes!(company_scale_ids: company_scale_ids,industry_ids: industry_ids,occupation_ids: occupation_ids, work_area_ids: work_area_ids)
  end
  

end
