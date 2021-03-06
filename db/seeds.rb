# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

require 'faker'

# create 15 topics
topics = []
15.times do
    topics << Topic.create(
    name: Faker::Lorem.words(rand(1..10)).join(" "),
    description: Faker::Lorem.paragraph(rand(1..4)))
end

rand(4..10).times do
    password = Faker::Lorem.characters(10)
    u = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password)
    u.skip_confirmation!
    u.save

    # Note: by calling User.new instead of create,
    # we create an instance of a user which isn't saved to the database.
    # The skip_confirmation! method sets the confirmation date
    # to avoid sending an email.  The save method updates the database.

    rand(5..100).times do
        topic = topics.first
        p = u.posts.create(
            topic: topic,
            title: Faker::Lorem.words(rand(1..10)).join(" "),
            body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))

        # set the created_at to a time within the past year
        p.update_attribute(:created_at, Time.now - rand(600..31536000))

        p.update_rank
        topics.rotate!
        # add this line to move the first topic to the last,
        # so that posts get assigned to different topics
        topics.rotate!

        post_count = Post.count
        User.all.each do |user|
            rand(1..5).times do
                p = Post.find(rand(1..post_count))
                c = user.comments.create(
                    body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"),
                    post: p)
                c.update_attribute(:created_at, Time.now - rand(600..31526000))
            end
        end

    end
end

u = User.new(
    name: 'Admin User',
    email: 'jordan@hudgens.com',
    password: 'helloworld',
    password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
    name: 'Moderator User',
    email: 'moderator@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
