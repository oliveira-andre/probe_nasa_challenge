class Probe < ApplicationRecord
  validates :x_asis, presence: true
  validates :y_asis, presence: true
end