ActiveAdmin.register User do
  menu label: "ユーザー一覧"
  filter :name, label:"名前"
  filter :kana, label:"フリガナ"
  filter :email, label:"メールアドレス"
  filter :general_sex, as: :string, label:"性別"
  filter :general_address1, as: :string, label:"住所"
  filter :graduation, as: :date_range, label:"卒業年度"
  filter :company_scales, label: '志望企業規模'
  filter :industries, label: '志望業界'
  filter :occuptions, label: '志望職種'
  filter :work_areas, label: '志望勤務エリア'
  filter :work_styles, label: '重視する働き方'
  filter :welfares, label: '重視する福利厚生'
  filter :company_features, label: '重視する企業の特徴'
  filter :company_points, label: '重視する採用の特徴'
  index do
    column :id
    column :name
    column :kana
    column :general_university
    column :sex
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
