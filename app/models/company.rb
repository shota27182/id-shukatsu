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
