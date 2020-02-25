class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :follower,         class_name: "Relationship",
                              foreign_key: :follower_id,
                              dependent: :destroy

  has_many :followed,         class_name: "Relationship",
                              foreign_key: :followed_id,
                              dependent: :destroy
                              
  has_many :follower_user,    through: :followed,
                              source: :follower # 自分をフォローしている人

  has_many :following_user,   through: :follower,
                              source: :followed # 自分がフォローしている人


  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}

  scope :name_is, -> (name) { where(name: name) }

  def self.search(keyword, search_type)
    case search_type
    when '完全一致'
      User.name_is(keyword)
    when '前方一致'
      User.where("name LIKE ?", "#{keyword}%")
    when '後方一致'
      User.where("name LIKE ?", "%#{keyword}")
    when '部分一致'
      User.where("name LIKE ?", "%#{keyword}%")
    else 
      User.all
    end
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id.to_i ).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
