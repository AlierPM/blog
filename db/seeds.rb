require 'faker'

 2.times do
	 User.create(name: Faker::Name.name, photo: Faker::Avatar.image, bio: Faker::Lorem.paragraph, posts_counter: 0)
 end

#Create at least 4 posts for each user by running the following code in the seed file:

 4.times do
	 Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id, comments_counter: 0, likes_counter: 0)
 end

#Create at least 2 comments for each post by running the following code in the seed file:

 2.times do
	 Comment.create(content: Faker::Lorem.paragraph, user_id: User.all.sample.id, post_id: Post.all.sample.id)
 end

#Create at least 2 likes for each post by running the following code in the seed file:

 2.times do
	 Like.create(user_id: User.all.sample.id, post_id: Post.all.sample.id)
 end