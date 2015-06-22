require 'faker'

50.times do 
  Post.create!(
    title:  Faker::Lorem.sentence, 
    body:   Faker::Lorem.paragraph
  )
end

posts = Post.all

100.times do 
  Comment.create!(
    post: posts.sample, 
    body: Faker::Lorem.paragraph
  )
end

10.times do 
  Advertisement.create!(
    title: Faker::Internet.domain_name,
    copy: Faker::Company.catch_phrase,
    price: 0
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisement created"