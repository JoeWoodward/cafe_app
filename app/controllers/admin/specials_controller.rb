class Admin::SpecialsController < Admin::ApplicationController
  skip_before_filter :set_section_instance_vars, only: :sort
  before_filter :require_login

  def new
    @special = Special.new
  end

  def index
    @specials = Special.order(:position).page(params[:page]).per(10)
  end

  def show
    @special = Special.find(params[:id])
  end

  def edit
    @special = Special.find(params[:id])
  end

  def create
    @special = Special.new(params[:special])
    if @special.save
      redirect_to [:admin, @special], notice: "Successfully added #{@special.title}"
    else
      render :new
    end
  end

  def update
    @special = Special.find(params[:id])
    if @special.update_attributes(params[:special])
      redirect_to [:admin, @special], notice: "Successfully updated #{@special.title}"
    else
      render :edit
    end
  end

  def destroy
    @special = Special.find(params[:id])
    @special.delete
    redirect_to [:admin, :specials], notice: "Successfully deleted #{@special.title}"
  end

  def reorder
    @specials = Special.order(:position)
  end

  def sort
    specials = Special.all
    specials.each do |special|
      special.position = params['special'].index(special.id.to_s) + 1
      special.save
    end
    render :nothing => true
  end
end
