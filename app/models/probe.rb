class Probe < ApplicationRecord
  validates :x_axis, presence: true
  validates :y_axis, presence: true
  validates :direction, presence: true
  validate  :invalid_position

  def invalid_position
    errors.add(:x_axis) if x_axis < 0
    errors.add(:y_axis) if y_axis < 0
    errors.add(:x_axis) if x_axis > 4
    errors.add(:y_axis) if y_axis > 4
  end
end