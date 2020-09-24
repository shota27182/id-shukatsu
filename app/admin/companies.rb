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
  
  form do |f|
    f.inputs 'Company' do
      f.input :name, label:"会社名"
      f.input :kana, label:"フリガナ"
      f.input :address, label:"住所"
      f.input :category, label:"事業内容"
      f.input :people, label:"従業員数"
      f.input :establishment, label:"設立年月日"
      f.input :url, label:"採用ページリンク"
      f.input :introduction, label:"会社紹介"
      f.inputs "募集職種", for: [:company_requirement, f.object.company_requirement || CompanyRequirement.new({company_id: f.object.id})] do | i |
        i.input :occupation, label:"募集職種"
        i.input :work, label:"業務内容"
        i.input :qualification, label:"応募資格"
        i.input :holiday, label:"休日・休暇"
        i.input :welfare, label:"待遇・福利厚生"
      end
      f.inputs do
        f.has_many :company_profiles, allow_destroy: true do |t|
          t.input :title, label:"タイトル"
          t.input :content, label:"内容"
        end
      end
      f.inputs '企業規模' do
        f.has_many :company_profiles, heading: '企業規模',new_record: true, allow_destroy: true do |t|
          t.input :company_profile_id,label: '企業規模',as: :select,collection: CompanyScale.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '企業規模' do
        f.has_many :company_company_scales, heading: '企業規模',new_record: true, allow_destroy: true do |t|
          t.input :company_scale_id,label: '企業規模',as: :select,collection: CompanyScale.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '業界' do
        f.has_many :company_industries, heading: false,new_record: true, allow_destroy: true do |t|
          t.input :industry_id,label: '業界',as: :select,collection: Industry.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '職種' do
        f.has_many :company_occupations, heading: false,new_record: true, allow_destroy: true do |t|
          t.input :occupation_id,label: '職種',as: :select,collection: Occupation.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '勤務エリア' do
        f.has_many :company_work_areas, heading: false,new_record: true, allow_destroy: true do |t|
          t.input :work_area_id,label: '勤務エリア',as: :select,collection: Occupation.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '働き方' do
        f.has_many :company_work_styles, heading: false,new_record: true, allow_destroy: true do |t|
          t.input :work_style_id,label: '働き方',as: :select,collection: Occupation.all.map { |a| [a.name, a.id] }
        end
      end
      f.inputs '福利厚生' do
        f.has_many :company_welfares, heading: false,new_record: true, allow_destroy: true do |t|
          t.input :welfare_id,label: '福利厚生',as: :select,collection: Welfare.all.map { |a| [a.name, a.id] }
        end
      end
      
    end
    f.actions
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
