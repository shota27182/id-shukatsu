ActiveAdmin.register Article do
  menu label: "記事一覧"
  filter :title, label:"タイトル"
  filter :tags, label:"タグ"
  filter :created_at, label:"作成日"
  index do
    column :id do |article|
      link_to article.id, admin_article_path(article)
    end
    column :タイトル do |article|
      link_to article.title, admin_article_path(article)
    end
    column :作成日 do |article|
      link_to article.created_at, admin_article_path(article)
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :img, :content, :created_by, :day_pageview
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :img, :content, :created_by, :day_pageview]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
