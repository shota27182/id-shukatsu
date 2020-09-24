ActiveAdmin.register User do
  menu label: "ユーザー一覧"
  filter :name, label:"名前"
  filter :kana, label:"フリガナ"
  filter :email, label:"メールアドレス"
  filter :general_sex, as: :select, collection: ["male" , "female"], label:"性別"
  filter :general_address1, as: :string, label:"住所"
  filter :graduation, as: :date_range, label:"卒業年度"
  filter :education_classification, as: :select, collection: ["humanities" , "science"], label: '文理'
  filter :education_university, as: :string, label: '大学名'
  filter :education_classification, as: :select, collection: ["humanities" , "science"], label: '文理'
  filter :company_scales, label: '志望企業規模'
  filter :industries, label: '志望業界'
  filter :occuptions, label: '志望職種'
  filter :work_areas, label: '志望勤務エリア'
  filter :work_styles, label: '重視する働き方'
  filter :welfares, label: '重視する福利厚生'
  filter :company_features, label: '重視する企業の特徴'
  filter :company_points, label: '重視する採用の特徴'
  index do
    column :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column :名前 do |user|
      link_to user.name, admin_user_path(user)
    end
    column :フリガナ do |user|
      link_to user.kana, admin_user_path(user)
    end
    column :性別 do |user|
      if user.general.present?
        link_to user.general.sex, admin_user_path(user)
      end
    end
    column :大学名 do |user|
      if user.education.present?
        link_to user.education.university, admin_user_path(user)
      end
    end
  end
  
  show do
    attributes_table do
      row :名前 do |user|
        user.name
      end
      row :フリガナ do |user|
        user.kana
      end
      row :メールアドレス do |user|
        user.email
      end
      row :性別 do |user|
        user.general.sex
      end
      row :誕生日 do |user|
        user.general.birthday
      end
      row :住所 do |user|
        user.general.address1 + user.general.address2 + user.general.building_name
      end
      row :電話番号 do |user|
        user.general.tel
      end
      row :大学名 do |user|
        user.education.university
      end
      row :学部 do |user|
        user.education.faculty
      end
      row :学科 do |user|
        user.education.department
      end
      row :学年 do |user|
        Grade.find_by(id: user.education.grade_id).name
      end
      row :卒業年度 do |user|
        user.education.graduation
      end
      row :文理 do |user|
        user.education.classification
      end
      row :ゼミ・研究室 do |user|
        user.education.seminar
      end
      row :出身高校 do |user|
        user.education.highschool
      end
      row :志望企業規模 do |user|
        user.company_scales
      end
      row :志望業界 do |user|
        user.industries
      end
      row :志望職種 do |user|
        user.occupations
      end
      row :志望勤務エリア do |user|
        user.work_areas
      end
      row :働き方 do |user|
        user.work_styles
      end
      row :福利厚生 do |user|
        user.welfares
      end
      row :企業の特徴 do |user|
        user.company_features
      end
      row :採用の特徴 do |user|
        user.company_points
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  
  # permit_params :name, :email, :password_digest, :remember_digest, :activation_digest, :activated, :activated_at, :reset_digest, :reset_sent_at, :status, :kana, :invitation_token
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password_digest, :remember_digest, :activation_digest, :activated, :activated_at, :reset_digest, :reset_sent_at, :status, :kana, :invitation_token]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
