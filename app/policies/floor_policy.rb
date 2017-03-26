class FloorPolicy
  attr_reader :user, :floor

  def initialize(user, floor)
    @user = user
    @floor = floor
  end

  def update?
    user.developer? && user.owner?(floor.property.building_complex)
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.developer? && user.owner?(floor.property.building_complex)
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
