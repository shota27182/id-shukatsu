class ArticleImage < ApplicationRecord
  belongs_to :article
  
  has_attached_file :image, Proc.new {
    options = {
      :storage => :s3,
      :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
      :s3_permissions => "public-read",
      :s3_headers => {'Expires' => 10.year.from_now.httpdate},
      :styles => {
      :"70x52" => ["70x52#", :jpg], # 4:3
      :"280x210" => ["280x210#", :jpg], # 4:3
      },
      #:convert_options => { :thumb => "-quality 85"},
      :default_url => "/images/:style/missing.png",
      :size => { :in => 0..(4.megabytes) }
    }
  }.call

  validates_attachment_content_type :image, :content_type =>/^image\/(.*)/

  def file
    Paperclip.io_adapters.for(image)
  end

  def url(style = "")
    "https://s3-ap-northeast-1.amazonaws.com/webcreation.co.jp.samlet.resources/" + image.path(style)
  end
  
end
