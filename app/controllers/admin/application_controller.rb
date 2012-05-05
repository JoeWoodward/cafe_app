class Admin::ApplicationController < ActionController::Base
  before_filter :set_section_instance_vars

  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  # Render a templated "Not Found" page via app/views/custom_pages/404.html.haml
  def render_404
    render 'static_pages/404', :status => :not_found
    return true
  end

  # Sorcery method which is called if no current user was present while
  # trying to access a protected page
  def not_authenticated
    redirect_to login_path, notice: 'Please login to access the administration area'
  end

  # used for populating the navbar in the admin area
  def set_section_instance_vars
    @take_away = Section.find_by_name('take-away')
    @eat_in = Section.find_by_name('eat-in')
    if params[:section_id]
      @section = Section.find(params[:section_id])
    end
  end
end
