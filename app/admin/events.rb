ActiveAdmin.register Event do
menu label: "イベント一覧"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :img, :introduction, :point, :flow, :category, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :img, :introduction, :point, :flow, :category, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
