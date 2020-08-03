class AdminPage::ArticlesController < ApplicationController
 
  
  def index
  end
  
  def new
    @article = Article.new
    options = {
        bucket: 'backup-id-shukatsu',
        region: 'ap-northest-1',
        keyStart: 'uploads/',
        acl: 'public-read',
        accessKey: ENV['S3_ACCESS_KEY'],
        secretKey: ENV['S3_SECRET_KEY'],
    }

    @aws_data = FroalaEditorSDK::S3.data_hash(options)
  end
  
  def create
    @article = Article.create(article_params)
    redirect_to '/admin_page/articles'
  end
  
  def edit
    options = {
        bucket: 'backup-id-shukatsu',
        region: 'ap-northest-1',
        keyStart: 'uploads/',
        acl: 'public-read',
        accessKey: ENV["aws_access_key_id"],
        secretKey: ENV["aws_secret_access_key"]
    }

    @aws_data = FroalaEditorSDK::S3.data_hash(options)
  end
  
  def update
  end
  
  private
      def article_params
        params.require(:article).permit(:title, :content)
      end
      def hash_init
        options = {
          bucket: 'backup-id-shukatsu',
          region: 'ap-northeast-1', # japan[Tokyo]
          keyStart: 'uploads/', # uploads/filename.png
          acl: 'public-read',
          accessKey: ENV["aws_access_key_id"],
          secretKey: ENV["aws_secret_access_key"]
        }
          @aws_data = FroalaEditorSDK::S3.data_hash(options)
      end
      
end