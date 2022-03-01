class Goal < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :description, presence: true

  def self.search(keyword)
    # return Goal.all unless search
    # Goal.where(['title LIKE OR description LIKE ?', "%#{search}%", "%#{search}%"])
    Goal.where(['description LIKE ?', "%#{keyword}%"])
  end
end