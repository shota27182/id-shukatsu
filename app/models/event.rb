class Event < ApplicationRecord
    has_many :event_schedules, dependent: :destroy
    has_many :user_events, dependent: :destroy
    has_many :users, through: :user_events
    belongs_to :company, optional: true
    has_many :event_profiles, dependent: :destroy
    has_many :event_histories, dependent: :destroy
    mount_uploader :img, EventImageUploader
    
    accepts_nested_attributes_for :event_schedules
    accepts_nested_attributes_for :event_profiles
    
     def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
          event = find_by(id: row["id"]) || new
          # CSVからデータを取得し、設定する
          event.attributes = row.to_hash.slice(*updatable_attributes)
          event.img = 'no_image.png'
          # 保存する
          event.save
          
          event_schedule = event.event_schedules.build
          event_schedule.attributes = row.to_hash.slice(*build_accessible_attributes) 
          event_schedule.save
        end
     end
    
    def self.updatable_attributes
        ["id", "company_id", "name", "category", "introduction", "flow"]
    end
    
    def self.build_accessible_attributes
        ["title", "place", "address", "deadline", "url"]
    end
end
