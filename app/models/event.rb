class Event < ApplicationRecord
    has_many :event_schedules, dependent: :destroy
    has_many :user_events, dependent: :destroy
    has_many :users, through: :user_events
    belongs_to :company
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
          event.icon = 'no_image.png'
          # 保存する
          event.save
          
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
end
