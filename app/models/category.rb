class Category < ActiveRecord::Base
  # Category belongs to section, seeds.rb creates two sections, eat-in and take-away
  belongs_to :section
  # Each category has many menu-items, these will be destroyed if you delete the parent category
  has_many :menu_items, dependent: :destroy

  #uses friendly_id for pretty URLs (https://github.com/norman/friendly_id)
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Each category has an image so we mount the uploader to this model, uses the carrierwave gem (https://github.com/jnicklas/carrierwave)
  # You can find the uploader at app/uploaders/image_uploader.rb
  mount_uploader :image, ImageUploader

  # Validations
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :image

  # Format the name of the category before the validations.
  before_validation :format_category

  def format_category
    # downcase before titleize to prevent bug where
    # a string with two capitals in a word is split
    # i.e. HEllo would become H Ello
    self.name = self.name.downcase.titleize.pluralize
  end
end
