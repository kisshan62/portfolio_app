module NotificationsHelper
  def notification_form(notification)
    @comment = nil
    visitor = link_to notification.visitor.username, notification.visitor, style:"font-weight: bold"
    # your_goal = link_to('あなたの投稿', notification.goal, style: "font-weight: bold", remote: true)
    your_goal = link_to 'あなたの投稿', notification.goal, style: "font-weight: bold"
    case notification.action
      when "follow"
        "#{visitor}があなたをフォローしました"
      when "like"
        "#{visitor}が#{your_goal}にいいね！しました"
      when "comment"
        @comment = Comment.find_by(id: notification.comment_id)&.content
        "#{visitor}が#{your_goal}にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end
end
