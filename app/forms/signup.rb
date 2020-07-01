class Signup
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::SecurePassword
  extend ActiveModel::Callbacks

  attr_accessor :remember_token, :activation_token, :reset_token
  attribute :email, :string
  attribute :password, :string
  attribute :password_digest, :string
  attribute :activation_digest, :string
  attribute :activated, :boolean, default: false
  attribute :name, :string
  attribute :activated_at, :datetime
  attribute :kana, :string

  validates :email,
            presence: true,
            format: { with: /\A.+@.+\z/ }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,presence: true, length: { maximum: 50 }, allow_blank: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: { allow_blank: true }
  validates :kana, presence: true
  has_secure_password
  define_model_callbacks :save
  before_save   :downcase_email
  before_save :create_activation_digest
  
  validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED
  validates_confirmation_of :password, allow_blank: true
  

  def save
    run_callbacks :save do
      return false if invalid?
      user = User.new(name: name, email: email, password: password, kana: kana, password_confirmation: password_confirmation,activation_digest: activation_digest,activation_token: activation_token)
      user.save!
      user.send_activation_email
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
    
  def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
  end
    
  def password_reset_expired?
      reset_sent_at < 2.hours.ago
  end
  
  private
       
       def downcase_email
           self.email = email.downcase
       end
       
       def create_activation_digest
           self.activation_token = User.new_token
           self.activation_digest = User.digest(activation_token)
       end
end