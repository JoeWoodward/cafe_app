class MenuItem < ActiveRecord::Base
  attr_accessible :description, :price_pence, :price_pound, :title

  # uses friendly_id for pretty URLs (https://github.com/norman/friendly_id)
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Format menu items before validations
  before_validation :format_menu_item

  # Validations for menu items
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price_pound
  validates_presence_of :price_pence

  def format_menu_item
    # Format the title
    self.title = self.title.downcase.titleize
  end
end
