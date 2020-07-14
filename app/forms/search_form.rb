class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string
  validates :keyword, length: { minimum: 20 }
end