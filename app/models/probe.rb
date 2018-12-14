class Probe < ApplicationRecord
  validates :x_axis, presence: true
  validates :y_axis, presence: true
  validates :direction, presence: true
end