class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  validates :content, presence: true
  has_many :notifications, dependent: :destroy

  def self.search(keyword, search_pattern)
    split_keyword = keyword.split(/[[:blank:]]+/).select(&:present?).uniq
    if search_pattern == "or_match"
      @comments = Comment.none
      split_keyword.each do |keyword|
        @comments = @comments.or(Comment.where(['content LIKE ?', "%#{keyword}%"]))
      end
    elsif search_pattern == "and_match"
      @comments = Comment
      split_keyword.each do |keyword|
        @comments = @comments.where(['content LIKE ?', "%#{keyword}%"])
      end
    end
    @comments
  end
end
