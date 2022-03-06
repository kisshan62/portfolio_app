class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  validates :content, presence: true

  def self.search(keyword)
    split_keyword = keyword.split(/[[:blank:]]+/).select(&:present?).uniq
    @comments = Comment.none
    # binding.pry
    split_keyword.each do |keyword|
      @comments = @comments.or(Comment.where(['content LIKE ?', "%#{keyword}%"]))
    end
    @comments
  end
end
