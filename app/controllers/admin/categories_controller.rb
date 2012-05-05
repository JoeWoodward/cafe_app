class Admin::CategoriesController < Admin::ApplicationController
  # sort action is put only so no need to set_section_instance_vars
  skip_before_filter :set_section_instance_vars, only: :sort
  # require the user to be logged in before using this controller
  before_filter :require_login

  def index
    @categories = @section.categories.order(:position).page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @menu_items = @category.menu_items.order(:position).page(params[:page]).per(10)
  end

  def create
    @category = @section.categories.new(params[:category])
    if @category.save
      redirect_to [:admin, @section, @category], notice: 'Successfully created new category'
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to [:admin, @section, @category], notice: 'Successfully updated catagory'
    else
      render :edit
    end
  end

  def destroy
    @catagory = Category.find(params[:id])
    @catagory.destroy
    redirect_to [:admin, @section, :categories], notice: 'Successfully deleted category'
  end

  def reorder
    @categories = @section.categories.order(:position)
  end

  # used to reorder categories through put request
  def sort
    section = Section.find(params[:section_id])
    categories = section.categories
    categories.each do |category|
      category.position = params['category'].index(category.id.to_s) + 1
      category.save
    end
    render :nothing => true
  end
end
