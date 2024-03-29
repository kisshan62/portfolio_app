class Goal < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  def self.search(keyword, search_pattern)
    split_keyword = keyword.split(/[[:blank:]]+/).select(&:present?).uniq
    if search_pattern == "or_match"
      @goals = Goal.none
      split_keyword.each do |keyword|
      @goals = @goals.or(Goal.where(['title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%"]))
    end
    elsif search_pattern == "and_match"
      @goals = Goal
      split_keyword.each do |keyword|
        @goals = @goals.where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%")
      end
    end
    @goals
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(goal_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      goal_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end