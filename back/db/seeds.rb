
# # ユーザー作成
# 60.times do |n|
#   User.find_or_create_by(name: "user#{n}", uid:"uid#{n}", uuid: "uuid#{n}", provider: "google_oauth2")
# end

# # 投稿作成
# 30.times do |n|
#   post = Post.new
#   # タグをランダムで作成＋投稿に紐付け
#   tag_counts = Random.rand(1..5)
#   tag_counts.times do |m|
#     post.tags << Tag.find_or_create_by(name: "タグ#{m}")
#   end

#   # ジャンルをランダムで作成＋投稿に紐付け
#   genre_counts = Random.rand(1..5)
#   genre_counts.times do |m|
#     post.genres << Genre.find_or_create_by(name: "ジャンル#{m}")
#   end

#   # ランダムで選んだユーザーによる手紙を作成＋投稿に紐付け
#   count = Random.rand(1..10)
#   count.times do |m|
#     user = User.order("RAND()").first
#     letter = user.letters.new(name: "名もなき人", sentences: "こんにちは、#{m}回目の手紙です。")
#     post.letters << letter
#   end
#   post.save
# end