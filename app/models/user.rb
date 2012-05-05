class User < ActiveRecord::Base
  # uses sorcery gem to log in/out
  authenticates_with_sorcery!

  # uses friendly id (https://github.com/norman/friendly_id)
  # for pretty URLs i.e.
  # http://www.acafe.com/users/bob
  # instead of an integer id i.e.
  # http://www.acafe.com/users/1
  extend FriendlyId
  friendly_id :first_name, use: :slugged

  # format the users attributes before each save action
  before_save :format_attributes

  # validations for the users attributes
  validates_presence_of :first_name, message: 'You forgot to tell me what your name is'
  validates_presence_of :last_name, message: 'You forgot to tell me what you surname is'
  validates_presence_of :email, message: 'I need your email so I can email you if you forget your password'
  validates_uniqueness_of :email, message: 'It looks like your email\'s already in the system'
  # only on create so the user doesn't have to type a new password if
  # they edit their name
  validates_presence_of :password, on: :create

  validates_confirmation_of :password, message: 'Please confirm your password'

  # allow blank is so that a user can edit their other attributes
  # without changing thier password
  validates_length_of :password, minimum: 5, allow_blank: true

  # set the users email to lowercase and capitalise their name before
  # each save.
  def format_attributes
    self.email = self.email.downcase
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end

  # getter method to return the users full name
  def full_name()
    self.first_name + " " + self.last_name
  end
end
