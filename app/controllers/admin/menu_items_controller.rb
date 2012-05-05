class Admin::MenuItemsController < Admin::ApplicationController
  skip_before_filter :set_section_instance_vars, only: :sort
  before_filter :require_login

  def new
    @menu_item = MenuItem.new
    @category = Category.find(params[:category_id])
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @menu_item = @category.menu_items.new(params[:menu_item])
    if @menu_item.save
      redirect_to [:admin, @section, @category, @menu_item], notice: "Successfully added #{@menu_item.title} to the menu items"
    else
      render :new
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @category = Category.find(params[:category_id])
    if @menu_item.update_attributes(params[:menu_item])
      redirect_to [:admin, @section, @category, @menu_item], notice: "Successfully updated #{@menu_item.title}"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.delete
    redirect_to [:admin, @section, @category], notice: "Successfully deleted #{@menu_item.title}"
  end

  def reorder
    @category = Category.find(params[:category_id])
    @menu_items = @category.menu_items.order(:position)
  end

  def sort
    @section = Section.find(params[:section_id])
    @category = @section.categories.find_by_name(params[:category_id].titleize)
    menu_items = @category.menu_items
    menu_items.each do |menu_item|
      menu_item.position = params['menu_item'].index(menu_item.id.to_s) + 1
      menu_item.save
    end
    render :nothing => true
  end
end
