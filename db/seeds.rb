# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
def random_minutes
  rand(2..3).to_s + ":#{rand(0..5)}0".to_s
end

User.destroy_all
Contest.destroy_all
Song.destroy_all
Vote.destroy_all

# Create User
10.times { User.create! username: Faker::FunnyName.name } 

# Create Sogss
10.times { Song.create!(title: Faker::Music::GratefulDead.song, album: Faker::Music.album, artist: Faker::Music::GratefulDead.player, length: random_minutes) }

# Create a Contest
contest = Contest.create! topic: "Rock's Songs", start_date: Date.today - 1, end_date: Date.today + 2, state: 0

# Adding songs to a contest
rand(5..10).times { 
  contest.selections.create! song: Song.all.sample, user: User.all.sample 
}

contest.selections.each do |selection|
  rand(1..10).times { Vote.create! user: User.all.sample, selection: selection }
end