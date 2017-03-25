class BuildingComplexPolicy
  attr_reader :user, :building_complex

  def initialize(user, building_complex)
    @user = user
    @building_complex = building_complex
  end

  def update?
    user.developer? && user.owner?(building_complex)
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.developer? && user.owner?(building_complex)
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
