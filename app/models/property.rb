class Property < ActiveRecord::Base
  belongs_to :building_complex
  validates :name, presence: true, uniqueness: { scope: :building_complex_id }
end
