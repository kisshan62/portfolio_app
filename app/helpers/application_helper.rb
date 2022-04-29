module ApplicationHelper
  def full_title(page_title = "")
    base_title = "目標達成アプリ"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def guestuser?
    current_user.email == "guest@example.com" ? true : false
  end

  def guestuser_phrase
    "（ゲストユーザは利用できません。）"
  end
end