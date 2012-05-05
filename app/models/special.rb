class Special < ActiveRecord::Base
  # use friendly id gem for pretty URLs (https://github.com/norman/friendly_id)
  extend FriendlyId
  friendly_id :title, use: :slugged

  # format the special before validating
  before_validation :format_special

  # Validations for special
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price_pound
  validates_presence_of :price_pence

  def format_special
    # format the special's title
    self.title = self.title.downcase.titleize
  end
end
