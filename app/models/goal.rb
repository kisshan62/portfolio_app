class Goal < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :description, presence: true

  def self.search(keyword)
    # @goals = Goal.where(['title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%"])
    split_keyword = keyword.split(/[[:blank:]]+/).select(&:present?).uniq
    @goals = Goal.none
    # binding.pry
    split_keyword.each do |keyword|
      @goals = @goals.or(Goal.where(['title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%"]))
    end
    @goals
  end
end