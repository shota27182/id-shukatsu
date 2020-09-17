ActiveAdmin.register Company do
  menu label: "企業一覧"
  filter :name, label:"会社名"
  filter :kana, label:"フリガナ"
  filter :address, label:"住所"
  filter :company_scales, label:"企業規模"
  filter :industries, label:"業界"
  filter :occupations, label:"募集職種"
  filter :work_areas, label: '勤務エリア'
  filter :work_styles, label: '働き方'
  filter :welfares, label: '福利厚生'
  filter :company_features, label: '企業の特徴'
  filter :company_points, label: '採用の特徴'
  index do
    column :id do |company|
      link_to company.id, admin_company_path(company)
    end
    column :名前 do |company|
      if company.name.present?
        link_to company.name, admin_company_path(company)
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :introduction, :category, :people, :url, :img, :establishment, :email, :password_digest, :remember_digest, :icon, :address, :kana
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :introduction, :category, :people, :url, :img, :establishment, :email, :password_digest, :remember_digest, :icon, :address, :kana]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
