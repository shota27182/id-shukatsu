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


  def save
      raise ActiveRecord::RecordInvalid if invalid?
      user = User.find(user_id)
      user.update_attributes!(company_feature_ids: company_feature_ids, company_point_ids: company_point_ids, welfare_ids: welfare_ids, work_style_ids: work_style_ids, company_scale_ids: company_scale_ids,industry_ids: industry_ids,occupation_ids: occupation_ids, work_area_ids: work_area_ids)
  end
  

end