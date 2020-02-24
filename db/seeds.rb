# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fakerを日本語化する
Faker::Config.locale = :ja

profiles = [
  { email: "onigiri@example.com", name: "onigiri" },
  { email: "johnson@example.com", name: "johnson" },
  { email: "tonakai@example.com", name: "tonakai" },
  { email: "kokeshi@example.com", name: "kokeshi" },
  { email: "taiyou@example.com", name: "taiyou" },
]

# User
profiles.each do |profile|
  User.find_or_create_by!(email: profile[:email]) do |user|
    user.name = profile[:name]
    user.introduction = Faker::Lorem.characters(number:20)
    user.password = 'password'
  end
end
# User/

bodys = [
  'この本は僕が小さい頃母に読んでもらったものです。ひらがなしか出てこないので、老若男女問わず楽しメルと思います。',
  '吾輩がこの本を読んだとき、あまりの衝撃に失神してしまった。一読の価値あり。',
  'ワクワクした～ 読んでちょ',
  'ほんの匂いが良かったと思いまする',
  'なんていうかクリエイティブな気持ちにさせてくれたよ',
  'I feel so happy!!',
  'Do you like something cake?',
  'I have been suffering in the Andes in the past.'
]

comments = [
  'この本に感銘を受けました。',
  '友人に勧めたいと思いました。',
  '僕には理解できない領域だと感じました。',
  'この本を読むと故郷の景色を思い出します（（泣））',
  '僕は本を読むと眠くなるのですが、この本は5分間起きていられました！！',
  'You have a dream.',
  'I can jump from high places'
]

# Book & Comment
15.times do |num|
  author = User.all.sample
  book = Book.create!(
    title: "Book-#{author.name}-#{num+1}",
    body: bodys.sample,
    user_id: author.id
  )
end
# Book & Comment/

# Relationship
Relationship.create(
  user_id: 1,
  follow_user_id: 2
)

Relationship.create(
  user_id: 3,
  follow_user_id: 2
)

Relationship.create(
  user_id: 4,
  follow_user_id: 2
)

Relationship.create(
  user_id: 2,
  follow_user_id: 1
)

Relationship.create(
  user_id: 5,
  follow_user_id: 1
)
# Relationship/