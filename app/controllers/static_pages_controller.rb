class StaticPagesController < ApplicationController
  def home
  end

  def menu
    @specials = Special.order(:position)
    @eat_in = Section.find_by_name('eat-in')
    @take_away = Section.find_by_name('take-away')
  end

  def location
  end
end
