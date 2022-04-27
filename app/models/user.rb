class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_one_attached :avatar
  
  validates :username, presence: true

  # デフォルトの設定に、:omniauthable以下を追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: %i[twitter google_oauth2]

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider,
      user.uid = auth.uid,
      user.username = auth.info.name,
      user.password = Devise.friendly_token[0,20],
      user.email = User.dummy_email(auth),
      user.confirmed_at = Time.now
      # binding.pry
    end
  end

  # ダミーのメールアドレスを作成
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  def is_confirmation_period_expired?
    # メールアドレス確認メール有効期限チェック(期限はconfig/initializers/devise.rbのconfirm_withinで設定)
    self.confirmation_period_expired?
  end

  def self.search(keyword, search_pattern)
    split_keyword = keyword.split(/[[:blank:]]+/).select(&:present?).uniq
    if search_pattern == "or_match"
      @users = User.none
      split_keyword.each do |keyword|
        @users = @users.or(User.where(['username LIKE ?', "%#{keyword}%"]))
      end
    elsif search_pattern == "and_match"
      @users = User
      split_keyword.each do |keyword|
        @users = @users.where(['username LIKE ?', "%#{keyword}%"])
      end
    end
    @users
  end
end