# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'securerandom'

def random_minutes
  rand(1000..2500)
end

User.destroy_all
Contest.destroy_all
Song.destroy_all
Vote.destroy_all

# Create User
User.create!(email: 'jon@snow.com', password: '123456')
# AUTH JWT POST REQUEST 
# curl -X POST "http://localhost:3000/user_token" -d '{"auth": {"email": "jon@snow.com", "password": "123456"}}' -H "Content-Type: application/json"

10.times { User.create!(email: Faker::Internet.email, password: '123456') } 

# Create Sogss
10.times { 
  song = Song.new(title: Faker::Music::GratefulDead.song, album: Faker::Music.album, artist: Faker::Music::GratefulDead.player, length_ms: random_minutes, spotify_id: SecureRandom.hex) 
  song.album_cover = File.open("images/cover.jpeg")
  song.save
}

# Create a Contest
contest = Contest.create! topic: "Rock's Songs", start_date: Date.today - 1, end_date: Date.today + 2, state: 0

# Adding songs to a contest
# Excluding the first user for testing purpose
index_first_user = User.first.id + 1
Song.first(5).each do |song| 
  contest.selections.create! song: song, user: User.find(index_first_user)
  index_first_user += 1
end

contest.selections.each do |selection, i|
  rand(5..10).times { Vote.create! user: User.all.sample, selection: selection }
end