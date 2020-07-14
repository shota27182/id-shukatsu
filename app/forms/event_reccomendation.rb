class EventReccomendation
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :remember_token, :activation_token, :reset_token
  attribute :event_id, :integer
  attribute :score, :float
       
end