class MypageAccountForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::SecurePassword
  extend ActiveModel::Callbacks

  attr_accessor :remember_token, :activation_token, :reset_token
  attribute :email, :string
  attribute :password, :string
  attribute :password_digest, :string
  attribute :user_id

  validates :email,
            presence: true,
            format: { with: /\A.+@.+\z/ }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 6 },allow_nil: true
  has_secure_password
  define_model_callbacks :save
  before_save   :downcase_email
  
  

  def save
    run_callbacks :save do
      return false if invalid?
      user = User.find(user_id)
      user.update!(email: email, password: password, password_confirmation: password_confirmation)
      true
    end
  end
  
  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end
    
  def User.new_token
      SecureRandom.urlsafe_base64
  end
  
  def authenticated(attribute,token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest). is_password?(token)
  end
    
  def activate
      update_attribute(:activated,  true)
      update_attribute(:activated_at, Time.zone.now)
  end
    
  def send_activation_email
      UserMailer.account_activation(self).deliver_now
  end
    
  
  private
       
       def downcase_email
           self.email = email.downcase
       end
       
end