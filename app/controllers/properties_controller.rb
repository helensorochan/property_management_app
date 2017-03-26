class PropertiesController < ApplicationController
  before_filter :load_developer
  before_filter :load_building_complex
  before_filter :load_property, except: [:index, :new, :create]

  def index
    authorize Property
    @properties = collection
  end

  def new
    @property = collection.new
    authorize @property
  end

  def create
    @property = collection.new(property_params)
    authorize @property

    if @property.save
      redirect_to developer_building_complex_properties_url,
                  notice: t('.created', property: @property.name)
    else
      flash.now[:alert] = t('.create_error')
      render :new
    end
  end

  def edit
    authorize @property
  end

  def update
    authorize @property
    if @property.update_attributes(property_params)
      redirect_to developer_building_complex_properties_url,
                  notice: t('.updated', property: @property.name)
    else
      flash.now[:alert] = t('.update_error')
      render :edit
    end
  end

  def show
    authorize @property
  end

  def destroy
    authorize @property
    if @property.destroy
      redirect_to developer_building_complex_properties_url,
                  notice: t('.destroyed')
    else
      redirect_to developer_building_complex_properties_url,
                  notice: t('.not_destroyed')
    end
  end

  private

  def load_property
    @property = collection.find(params[:id])
  end

  def load_developer
    @developer = User.developers.find(params[:developer_id])
  end

  def load_building_complex
    @building_complex = BuildingComplex.where(user_id: params[:developer_id])
                                       .find(params[:building_complex_id])
  end

  def collection
    Property.where(building_complex_id: params[:building_complex_id])
  end

  def property_params
    params.require(:property)
          .permit(:name,
                  :description,
                  :feature_list,
                  attachments_attributes: [:file, :tempfile, :original_filename, :headers, :_destroy, :id])
  end
end
