ActiveAdmin.register User do
  menu label: "ユーザー一覧"
  index do
    column :name
    column :kana
    column :email
    column :created_at
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
