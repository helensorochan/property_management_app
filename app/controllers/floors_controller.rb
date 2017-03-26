class FloorsController < ApplicationController
  before_filter :load_developer
  before_filter :load_building_complex
  before_filter :load_property
  before_filter :load_floor, except: [:index, :new, :create]

  def index
    authorize Property
    @floors = collection
  end

  def new
    @floor = collection.new
    authorize @floor
  end

  def create
    @floor = collection.new(floor_params)
    authorize @floor

    if @floor.save
      redirect_to developer_building_complex_property_floors_url,
                  notice: t('.created', floor: @floor.range)
    else
      flash.now[:alert] = t('.create_error')
      render :new
    end
  end

  def edit
    authorize @floor
  end

  def update
    authorize @floor
    if @floor.update_attributes(floor_params)
      redirect_to developer_building_complex_property_floors_url,
                  notice: t('.updated', floor: @floor.range)
    else
      flash.now[:alert] = t('.update_error')
      render :edit
    end
  end

  def show
    authorize @floor
  end

  def destroy
    authorize @floor
    if @floor.destroy
      redirect_to developer_building_complex_property_floors_url,
                  notice: t('.destroyed')
    else
      redirect_to developer_building_complex_property_floors_url,
                  notice: t('.not_destroyed')
    end
  end

  private

  def load_floor
    @floor = collection.find(params[:id])
  end

  def load_developer
    @developer = User.developers.find(params[:developer_id])
  end

  def load_building_complex
    @building_complex = BuildingComplex.where(user_id: params[:developer_id])
                                       .find(params[:building_complex_id])
  end

  def load_property
    @property = Property.find(params[:property_id])
  end

  def collection
    Floor.where(property_id: params[:property_id])
  end

  def floor_params
    params.require(:floor)
          .permit(:description,
                  :start_from,
                  :end_to,
                  attachments_attributes: [:file, :tempfile, :original_filename, :headers, :_destroy, :id])
  end
end