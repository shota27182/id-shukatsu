class Company < ApplicationRecord
    attr_accessor :remember_token
    mount_uploader :img, CompanyImageUploader
    mount_uploader :icon, CompanyIconUploader
    has_secure_password validations: false

    has_one :company_requirement, dependent: :destroy
    has_many :company_profiles, dependent: :destroy
    has_many :company_company_features, dependent: :destroy
    has_many :company_features, through: :company_company_features
    has_many :company_industries, dependent: :destroy
    has_many :industries, through: :company_industries
    has_many :company_occupations, dependent: :destroy
    has_many :occupations, through: :company_occupations
    has_many :company_work_areas, dependent: :destroy
    has_many :work_areas, through: :company_work_areas
    has_many :company_work_styles, dependent: :destroy
    has_many :work_styles, through: :company_work_styles
    has_many :company_welfares, dependent: :destroy
    has_many :welfares, through: :company_welfares
    has_many :company_company_points, dependent: :destroy
    has_many :company_points, through: :company_company_points
    has_many :company_company_scales, dependent: :destroy
    has_many :company_scales, through: :company_company_scales
    has_many :events, dependent: :destroy
    has_many :user_companies, dependent: :destroy
    has_many :users, through: :user_companies 
    has_one :company_general, dependent: :destroy
    has_many :company_teleworks, dependent: :destroy
    has_many :teleworks, through: :company_teleworks
    has_many :company_work_times, dependent: :destroy
    has_many :work_times, through: :company_work_times
    has_one :salary, dependent: :destroy
    has_many :company_house_allowances, dependent: :destroy
    has_many :house_allowances, through: :company_house_allowances
    has_many :company_healthes, dependent: :destroy
    has_many :healthes, through: :company_healthes
    has_many :company_nursings, dependent: :destroy
    has_many :nursings, through: :company_nursings
    has_many :company_holidays, dependent: :destroy
    has_many :holidays, through: :company_holidays
    has_many :company_condolences, dependent: :destroy
    has_many :condolences, through: :company_condolences
    has_one :salary, dependent: :destroy
    
    accepts_nested_attributes_for :company_requirement
    accepts_nested_attributes_for :company_profiles
    accepts_nested_attributes_for :events
    
    def Company.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def Company.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = Company.new_token
        update_attribute(:remember_digest, Company.digest(remember_token))
    end
    
    def authenticated(attribute,token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest). is_password?(token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
          company = find_by(id: row["id"]) || new
          # CSVからデータを取得し、設定する
          company.attributes = row.to_hash.slice(*updatable_attributes)
          company.img = 'no_image.png'
          company.icon = 'no_image.png'
          # 保存する
          company.save
          
          company_requirement = company.build_company_requirement
          company_requirement.attributes = row.to_hash.slice(*build_accessible_attributes) 
          company_requirement.save
          
          if row['company_feature1'].present?
            company_feature1 = company.company_company_features.build(company_feature_id: row['company_feature1'])
            company_feature1.save
          end
          if row['company_feature2'].present?
            company_feature2 = company.company_company_features.build(company_feature_id: row['company_feature2'])
            company_feature2.save
          end
          if row['welfare1'].present?
            welfare1 = company.company_welfares.build(welfare_id: row['welfare1'])
            welfare1.save
          end
          if row['welfare2'].present?
            welfare2 = company.company_welfares.build(welfare_id: row['welfare2'])
            welfare2.save
          end
          if row['welfare3'].present?
            welfare3 = company.company_welfares.build(welfare_id: row['welfare3'])
            welfare3.save
          end
          if  row['work_style1'].present?
            work_style1 = company.company_work_styles.build(work_style_id: row['work_style1'])
            work_style1.save
          end
          if  row['work_style2'].present?
            work_style2 = company.company_work_styles.build(work_style_id: row['work_style2'])
            work_style2.save
          end
          if  row['work_style3'].present?
            work_style3 = company.company_work_styles.build(work_style_id: row['work_style3'])
            work_style3.save
          end
          if row['occupation1'].present?
            occupation1 = company.company_occupations.build(occupation_id: row['occupation1'])
            occupation1.save
          end
          if row['occupation2'].present?
            occupation2 = company.company_occupations.build(occupation_id: row['occupation2'])
            occupation2.save
          end
          if row['occupation3'].present?
            occupation3 = company.company_occupations.build(occupation_id: row['occupation3'])
            occupation3.save
          end
          if row['work_area'].present?
            work_area1 = company.company_work_areas.build(work_area_id: row['work_area'])
            work_area1.save
          end
          if row['industry'].present?
            industry1 = company.company_industries.build(industry_id: row['industry'])
            industry1.save
          end
          if row['company_scale'].present?
            company_scale1 = company.company_company_scales.build(company_scale_id: row['company_scale'])
            company_scale1.save
          end
        end
    end
    
    def self.updatable_attributes
        ["id", "name", "kana", "address", "category", "establishment", "people", "url", "introduction"]
    end
    
    def self.build_accessible_attributes
        ["holiday", "occupation", "qualification"]
    end
    
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    
        scope :search, -> (search_params) do
        return if search_params.blank?
    
        name_like(search_params[:name])
      end
      scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
    
    private
       
       def downcase_email
           self.email = email.downcase
       end

end
