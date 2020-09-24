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
  
  show do
    row :名前 do |company|
      company.name
    end
    row :フリガナ do |company|
      company.kana
    end
    row :住所 do |company|
      company.address
    end
    row :事業内容 do |company|
      company.category
    end
    row :従業員数 do |company|
      company.people
    end
    row :設立年月日 do |company|
      company.establishment
    end
    row :採用ページリンク do |company|
      company.url
    end
    row :会社紹介 do |company|
      company.introduction
    end
    row :企業規模 do |company|
      company.company_scales
    end
    row :業界 do |company|
      company.industries
    end
    row :募集職種 do |company|
      company.occupations
    end
    row :勤務エリア do |company|
      company.work_areas
    end
    row :働き方 do |company|
      company.work_styles
    end
    row :福利厚生 do |company|
      company.welfares
    end
    row :企業の特徴 do |company|
      company.company_features
    end
    row :採用の特徴 do |company|
      company.company_points
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
