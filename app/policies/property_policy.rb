class PropertyPolicy
  attr_reader :user, :property

  def initialize(user, property)
    @user = user
    @property = property
  end

  def update?
    user.developer? && user.owner?(property.building_complex)
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.developer? && user.owner?(property.building_complex)
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
