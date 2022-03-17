module GoalsHelper
  def start_day_state(goal)
    day_pattern = "開始日"
    start_day_count = (goal.start_date - Date.today).to_i if !goal.start_date.nil?
    if start_day_count.nil?
      "#{day_pattern}を設定してください"
    elsif start_day_count == 0
      "今日が#{day_pattern}の目標です！"
    elsif start_day_count.between?(1, 3)
      "#{day_pattern}まで残り#{start_day_count}日"
    else
      "#{day_pattern}:#{l goal.start_date}"
    end
  end

  def due_day_state(goal)
    day_pattern = "期限日"
    due_day_count = (goal.due_date - Date.today).to_i if !goal.due_date.nil?
    # caseを使うとno methodエラーになる場合がある
    # case due_day_count
    #   when nil
    #     "期限日を設定してください"
    #   when 0
    #     "今日が期限日の目標です！"
    #   when between?(1, 3)
    #     "期限日まで残り#{due_day_count}日"
    #   else
    #     "期限日:#{l goal.due_date}"
    if due_day_count.nil?
      "#{day_pattern}を設定してください"
    elsif due_day_count == 0
      "今日が#{day_pattern}の目標です！"
    elsif due_day_count.between?(1, 3)
      "#{day_pattern}まで残り#{due_day_count}日"
    else
      "#{day_pattern}:#{l goal.due_date}"
    end
  end
  
  def goal_state(goal)
    if goal.done == false
      "継続中"
    else goal.done == true
      "完了"
    end
  end
end