class UsersCoresForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :user_id, :integer
    attribute :company_feature_ids, array: :integer
    attribute :company_point_ids, array: :integer
    attribute :welfare_ids, array: :integer
    attribute :work_style_ids, array: :integer
    attribute :company_scale_ids, array: :integer
    attribute :industry_ids, array: :integer
    attribute :occupation_ids, array: :integer
    attribute :work_area_ids, array: :integer
    
    validates :company_feature_ids, :length => {:minimum   => 2}
    validates :company_point_ids, :length => {:minimum   => 2}
    validates :welfare_ids, :length => {:minimum   => 2}
    validates :work_style_ids,:length => {:minimum   => 2}
    validates :company_scale_ids,:length => {:minimum   => 2}
    validates :industry_ids, :length => {:minimum   => 2}
    validates :occupation_ids,:length => {:minimum   => 2}
    validates :work_area_ids,:length => {:minimum   => 2}


  def save
      raise ActiveRecord::RecordInvalid if invalid?
      user = User.find(user_id)
      user.update_attributes!(company_feature_ids: company_feature_ids, company_point_ids: company_point_ids, welfare_ids: welfare_ids, work_style_ids: work_style_ids, company_scale_ids: company_scale_ids,industry_ids: industry_ids,occupation_ids: occupation_ids, work_area_ids: work_area_ids)
      user.update(status:'core_registered')
  end
  

end