puts "🌱 Seeding spices..."

Phase.destroy_all
User.destroy_all
Post.destroy_all
Comment.destroy_all
Follower.destroy_all

Phase.create(phase: 'NYC-SE-071822')
Phase.create(phase: 'NYC-SE-062722')
Phase.create(phase: 'NYC-SE-080822')

20.times do 
    User.create(
        name: Faker::Name.name,
        bio: Faker::Quote.yoda,
        email: Faker::Internet.email,
        links: 'github.com',
        phase_id: Phase.all.sample.id 
    )
end

50.times do 
    Post.create(
        body: Faker::Movie.quote,
        link: Faker::Internet.domain_name,
        user_id: User.all.sample.id
    )
end

50.times do
    Comment.create(
        body: Faker::Quote.yoda,
        post_id: Post.all.sample.id
    )
end

30.times do 
    Follower.create(
        followers_id: User.all.sample.id,
        following_id: User.all.sample.id
    )
end

puts "✅ Done seeding!"
