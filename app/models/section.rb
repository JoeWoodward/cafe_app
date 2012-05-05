class Section < ActiveRecord::Base
  # Each section has many categories, i.e. Take-Away Menu could have
  # Baguettes, Sandwhiches, Cakes etc..
  has_many :categories
  attr_accessible :name

  #uses friendly_id for pretty URLs (https://github.com/norman/friendly_id)
  extend FriendlyId
  friendly_id :name, use: :slugged
end
