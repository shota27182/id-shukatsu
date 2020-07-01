class MypageUserProgramming
  include ActiveModel::Model
    attribute :user_id, :integer
    attribute :programming_id, :integer
    attribute :use_time, :string
    attribute :description, :string
end