module GoalsHelper
  def start_day_state(goal)
    start_day_count = (goal.start_date - Date.today) if !goal.start_date.nil?
    case start_day_count
      when nil
        "開始日を設定してください"
      when 0
        "今日が開始日の目標です！"
      when between?(1, 3)
        "開始日まで残り#{start_day_count}日"
      else
        "開始日:#{l goal.start_date}"
      end
  end

  def due_day_state(goal)
    due_day_count = (goal.due_date - Date.today) if !goal.due_date.nil?
    case due_day_count
      when nil
        "期限日を設定してください"
      when 0
        "今日が期限日の目標です！"
      when between?(1, 3)
        "期限日まで残り#{due_day_count}日"
      else
        "期限日:#{l goal.due_date}"
    end
  end  
end