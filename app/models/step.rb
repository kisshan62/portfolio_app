class Step < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :goal
end
