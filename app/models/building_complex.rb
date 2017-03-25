class BuildingComplex < ActiveRecord::Base
  belongs_to :user
  has_many :properties
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
