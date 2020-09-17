ActiveAdmin.register Event do
  menu label: "イベント一覧"
  filter :name, label:"タイトル"
  filter :category,as: :select, label:"カテゴリー"
  filter :event_schedules_deadline,as: :date_range, label:"申込期日"
  filter :event_schedules_place, as: :string, label:"開催場所"
  filter :event_schedules_holding_day, as: :string, label:"開催日"
  
  index do
    column :id
    column :name
    column :category
  end
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
