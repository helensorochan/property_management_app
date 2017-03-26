class BuildingComplex < ActiveRecord::Base

  belongs_to :user
  has_many :properties, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end
