class Property < ActiveRecord::Base

  belongs_to :building_complex
  has_many :attachments, as: :imageable, dependent: :destroy
  has_many :floors, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: { scope: :building_complex_id }
  validates :building_complex_id, presence: true
  validates :longitude, presence:true, numericality: true
  validates :latitude, presence:true, numericality: true

  acts_as_taggable_on :features
end
