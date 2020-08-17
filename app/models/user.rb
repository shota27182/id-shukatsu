class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    has_secure_password
    
    has_many :mentarity_company_features, dependent: :destroy
    has_many :company_features, through: :mentarity_company_features
    has_many :mentarity_company_points, dependent: :destroy
    has_many :company_points, through: :mentarity_company_points
    has_many :mentarity_welfares, dependent: :destroy
    has_many :welfares, through: :mentarity_welfares
    has_many :mentarity_work_styles, dependent: :destroy
    has_many :work_styles, through: :mentarity_work_styles
    has_many :wish_company_scales, dependent: :destroy
    has_many :company_scales, through: :wish_company_scales
    has_many :wish_industries, dependent: :destroy
    has_many :industries, through: :wish_industries
    has_many :wish_occupations, dependent: :destroy
    has_many :occupations, through: :wish_occupations
    has_many :wish_work_areas, dependent: :destroy
    has_many :work_areas, through: :wish_work_areas
    has_one :general, dependent: :destroy
    has_one :education, dependent: :destroy
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :user_programmings, dependent: :destroy
    has_many :programmings, through: :user_programmings
    has_one :user_eiken, dependent: :destroy
    has_one :user_toeic, dependent: :destroy
    has_one :user_toefl, dependent: :destroy
    has_many :user_languages, dependent: :destroy
    has_one :user_experience, dependent: :destroy
    has_one :user_internship, dependent: :destroy
    has_many :user_companies, dependent: :destroy
    has_many :companies, through: :user_companies
    has_many :notifications, dependent: :destroy
    has_many :event_histories, dependent: :destroy
    has_one :user_receive, dependent: :destroy
    has_many :active_invitations, class_name:  "Invitation",
                                  foreign_key: "invite_id",
                                  dependent:   :destroy
    has_many :inviting, through: :active_invitations, source: :invite
    has_many :passive_invitations, class_name:  "Invitation",
                                   foreign_key: "invited_id",
                                   dependent:   :destroy
    has_many :invited, through: :passive_invitations, source: :invited
    
    enum status:{
        no_registered: 0,
        basic_registered: 1,
        core_registered: 2
    }
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def generate_invitation_token
        self.invitation_token = loop do
          random_token = SecureRandom.hex(3)
          break random_token unless User.exists?(invitation_token: random_token)
        end
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(attribute,token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest). is_password?(token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def activate
        update_attribute(:activated,  true)
        update_attribute(:activated_at, Time.zone.now)
    end
    
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end
    
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
    
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    
    def create_notification_event_schedule!(current_user, event_schedule)
        entry_notification = current_user.notifications.build(
            title: '「' + Event.find_by(id: event_schedule.event_id).name + '」' + 'の申し込みが完了いたしました',
            content:  'この度は' + '「' + Event.find_by(id: event_schedule.event_id).name + '」' + 'にお申込みいただきありがとうございます。'
            )
        entry_notification.save!
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
