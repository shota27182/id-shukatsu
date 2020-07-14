require 'carrierwave/validations/active_model'
class PartnerUserGeneralForm
    
    include ActiveModel::Model
    include ActiveModel::Attributes
    extend CarrierWave::Mount
    
    mount_uploader :img, CompanyImageUploader
    mount_uploader :icon, CompanyIconUploader
    
    attr_accessor :introduction
    attribute :company_id, :integer
    attribute :name, :string
    attribute :category, :string
    attribute :people, :integer
    attribute :img, :string
    attribute :icon, :string
    attribute :url, :string
    attribute :address, :string
    attribute :kana, :string
    attribute :establishment, :date
    attribute 'establishment(1i)'
    attribute 'establishment(2i)'
    attribute 'establishment(3i)'

    validates :name, presence: true
    validates :introduction, presence: true
    validates :category, presence: true
    validates :people, presence: true
    validates :img, presence: true
    validates :icon, presence: true
    validates :url, presence: true
    validates :address, presence: true
    validates :establishment, presence: true
    validates :kana, presence: true

  def save
      return false if invalid?
      ActiveRecord::Base.transaction do
        company = Company.find(company_id)
        company.update!(kana: kana, introduction: introduction,name: name, category: category, people: people, img: img, icon: icon, url: url, address: address, establishment: establishment)
      end
  end
  

end