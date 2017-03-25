class BuildingComplexesController < ApplicationController
  before_filter :load_developer
  before_filter :load_building_complex, except: [:index, :new, :create]

  def index
    authorize BuildingComplex
    @building_complexes = collection
  end

  def new
    @building_complex = collection.new
    authorize @building_complex
  end

  def create
    @building_complex = collection.new(building_complex_params)
    authorize @building_complex
    if @building_complex.save
      redirect_to developer_building_complexes_url,
                  notice: t('.created', building_complex: @building_complex.name)
    else
      flash.now[:alert] = t('.create_error')
      render :new
    end
  end

  def edit
    authorize @building_complex
  end

  def update
    authorize @building_complex
    if @building_complex.update_attributes(building_complex_params)
      redirect_to developer_building_complexes_url(@developer),
                  notice: t('.updated', building_complex: @building_complex.name)
    else
      flash.now[:alert] = t('.update_error')
      render :edit
    end
  end

  def show
    authorize @building_complex
  end

  def destroy
    authorize @building_complex
    if @building_complex.destroy
      redirect_to developer_building_complexes_url,
                  notice: t('.destroyed')
    else
      redirect_to developer_building_complexes_url,
                  notice: t('.not_destroyed')
    end
  end

  private

  def collection
    BuildingComplex.where(user_id: params[:developer_id])
  end

  def load_developer
    @developer = User.developers.find(params[:developer_id])
  end

  def load_building_complex
    @building_complex = collection.find(params[:id])
  end

  def building_complex_params
    params.require(:building_complex).permit(:name, :description)
  end
end
