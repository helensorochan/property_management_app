class Floor < ActiveRecord::Base
  belongs_to :property
  has_many :attachments, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank

  validates :start_from, numericality: { only_integer: true, greater_than: 0 }
  validates :end_to, numericality: { only_integer: true, greater_than: :start_from }
  validates :property_id, :start_from, :end_to, presence: true
  validate :property_overlap_ranges


  scope :property_floors, -> (value) { where(property_id: value) }

  def range
    start_from..end_to
  end

  private

  def property_overlap_ranges
    Floor.where.not(id: id).property_floors(property_id).each do |existing_floor|
      if existing_floor.range.overlaps?(range)
        errors[:base] << "New range overlaps existing range for property"
      end
    end
  end
end