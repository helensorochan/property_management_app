class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  enum role: { viewer: 0, developer: 1 }

  has_many :building_complexes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true

  scope :developers, -> { where(role: User.roles[:developer]) }
  scope :viewers, -> { where(role: User.roles[:viewer]) }

  def owner?(building_complex)
    self == building_complex.user
  end
end
