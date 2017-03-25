class DevelopersController < ApplicationController
  def index
    @developers = collection.joins(:building_complexes)
                            .select('users.*, count(users.id) AS building_complexes_count')
                            .group('users.id')
                            .order('building_complexes_count desc')
  end

  def show
    @developer = collection.find(params[:id])
  end

  private

  def collection
    User.developers
  end
end
