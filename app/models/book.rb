class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.search(keyword, search_type)
    case search_type
    when '完全一致'
      Book.where(title: keyword)
    when '前方一致'
      Book.where("title LIKE ?", "#{keyword}%")
    when '後方一致'
      Book.where("title LIKE ?", "%#{keyword}")
    when '部分一致'
      Book.where("title LIKE ?", "%#{keyword}%")
    else 
      Book.all
    end
  end

	def favorited_by?(user)
		return false unless user.instance_of?(User)
		# この本のいいねにユーザが含まれているか？
		favorites.where(user_id: user.id).exists?
	end
end
