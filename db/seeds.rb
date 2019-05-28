require 'open-uri'
require 'nokogiri'

puts '-----------------------------'
puts 'destroying all previous datas'
puts '-----------------------------'

Friendship.destroy_all
UserReview.destroy_all
TeamReview.destroy_all
TeamMembership.destroy_all
Profile.destroy_all
Team.destroy_all
User.destroy_all
Game.destroy_all

puts '-----------------------------'
puts 'CREATING GAMES'
puts '-----------------------------'

ow_rank = %w[bronze silver gold platinium diamond master grandmaster top500]
ow_roles = %w[bastion dVa genji hanzo junkrat lúcio mccree mei mercy orisa pharah reaper reinhardt roadhog soldier76 sombra symmetra torbjörn tracer widowmaker winston zarya zenyatta]
overwatch = Game.create!(name: 'overwatch', rank_typology: ow_rank, players_quantity: 6)

puts 'Overwatch Game created'

csgo_rank = ['silver I', 'silver II', 'silver III', 'silver IV', 'silver Elite', 'silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Gold Nova Guardian I','Gold Nova Guardian II', 'Master Guardian Elite', 'Distinguished Master Guardian', 'Legendary Eagle', 'Legendary Eagle Master', 'Supreme Master First Class', 'The Global Elite']
csgo_roles = nil
csgo = Game.create!(name: 'overwatch', rank_typology: csgo_rank, players_quantity: 5)

puts 'CS:Go Game created'

# Parsing for lol roles
url_lol_role = 'https://leagueoflegends.fandom.com/wiki/List_of_champions/Position'
response = open(url_lol_role).read
noko = Nokogiri::HTML.parse(response)
champions = []
noko.search('td:first-child').each do |champion|
  champions << champion.text
end

champions = champions.uniq[4..-1]
champions.map! { |element| element[1..-3] }
champions
#

lol_rank = %w[bronze silver gold platinium diamond master challenger]
lol_roles = champions
lol = Game.create!(name: 'overwatch', rank_typology: csgo_rank, players_quantity: 5)

puts 'League of Legend created'

puts '-----------------------------'
puts 'CREATING 3 USERS'
puts '-----------------------------'

charline = User.create!(username: 'charlycade', email: 'charline@gmail.com', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu')
puts 'charline created'

puts '-----------------------------'
puts 'CREATING OVERWATCH PROFILES'
puts '-----------------------------'

user = charline
launcher_tag = '2422'
platform = 'pc'
mainrole = 'dVa'

profile_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/profile"
profile = open(profile_url).read
profile_json = JSON.parse(profile)
complete_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
complete = open(complete_url).read
complete_json = JSON.parse(complete)
main_hero_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
main_hero = open(main_hero_url).read
main_hero_json = JSON.parse(main_hero)

charline_profile = Profile.create(game_id: overwatch.id, user_id: charline.id, launcher_tag: launcher_tag, rank: complete_json['rating'], mainrole: mainrole, profile: profile_json, complete: complete_json, main_hero: main_hero_json)

puts 'charline overwatch profile created'

puts '-----------------------------'
puts 'CREATING 8 TEAMS FOR OVERWATCH'
puts '-----------------------------'

8.times do
  Team.create!(spirit: %w[casual, competitive].sample, rank_scale: ow_rank.sample, game: overwatch)
end

puts '8 teams created'

puts '-----------------------------'
puts 'CREATING 6 TEAM_MEMBERSHIPS FOR EACH TEAM'
puts '-----------------------------'

Team.all.each do |team|
  i = 0
  6.times do
    users = User.user_for_game(team.game).sample[6]
    TeamMembership.create!(user: users[i], team: team)
    i += 1
  end
end

puts 'all teams completed'
Team.all.each do |team|
  puts "#{team}.team_memberships"
end

puts '----------------------------------------------------'
puts 'CREATING 6 TEAM REVIEWS FOR 5 TEAMS WITH STATUS OVER'
puts '----------------------------------------------------'

good_reviews = ["That was a hell of a game. You rock girls!!! Let's play together again!", "Love Mercy, beat team mates ever. Thank you for this great game. See you", "You were awesome. We kicked some asses and that was sooo good.", "I loved this game. Love to win, love to have fun, love you. xoxoxoxo", "That was epic. We loose, that's for sure, but I don't care, I had a great time!", "Hey girls, hope you enjoyed it as much as I did!!!!"]
bad_reviews = ["This was not as good as I wanted it to be. Too bad, next time will be better", "Not that fun today. So sad."]
mild_reviews = ["It liked it. That was cool", "That was not the best game of my life. hate to loose but nice spirit on the team. Thanks anyway and we'll be better next time", "You cannot win every time. I wish... but no", "The game was OK but one player was not the Mercy spirit. Getting rid of toxicity in gaming is still a long way to go"]

Team.all.sample(5).each { |team| team.over! }

over_teams = Team.all_over
p over_team
p over_team.count

#Good reviews#
over_teams[0..-2].each do |team|
  j = 0
  6.times do
    TeamReview.create!(rating: [4,5].sample, comment: good_reviews[j])
    j += 1
  end
end

puts "24 good team reviews created"

#Mild and bad reviews#
over_teams[-2..-1].each do |team|
  j = 0
  2.times do
    TeamReview.create!(rating: [1,2], comment: bad_reviews[j])
    j += 1
  end
  j = 0
  4.times do
    TeamReview.create!(rating: [2,3], comment: mild_reviews[j])
    j += 1
  end
end

puts "4 bad team reviews created"
puts "8 mild team reviews created"

puts '-----------------------------------------------------------'
puts 'CREATING 6 USER REVIEWS FOR USERS IN TEAMS WITH STATUS OVER'
puts '-----------------------------------------------------------'

# user reviews ++ (endorse + add_friend)
over_teams[0..-2] do |team|
  UserReview.create!(user: team.team_users[0], add_friend: true, endorse: true)
  UserReview.create!(user: team.team_users[1], add_friend: true, endorse: true)
  UserReview.create!(user: team.team_users[2], add_friend: true, endorse: true)
  UserReview.create!(user: team.team_users[3], add_friend: false, endorse: true)
  UserReview.create!(user: team.team_users[4], add_friend: false, endorse: true)
  UserReview.create!(user: team.team_users[5], add_friend: true, endorse: true)
end

over_teams[-2..-1] do |team|
  UserReview.create!(user: team.team_users[0], add_friend: true, endorse: true)
  UserReview.create!(user: team.team_users[1], add_friend: false, endorse: true)
  UserReview.create!(user: team.team_users[2], add_friend: false, endorse: true)
  UserReview.create!(user: team.team_users[3], add_friend: false, endorse: true)
  UserReview.create!(user: team.team_users[4], add_friend: false, endorse: false, nok: true, nok_respect: true)
  UserReview.create!(user: team.team_users[5], add_friend: false, endorse: true, nok: true, nok_communication: true, nok_helpfulness: true)
end

puts "30 reviews created"
puts "26 users endorsed"
puts "14 users added as friends"
puts "4 users reported as nok"

puts "14 friendships automatically created"

puts "seeds are done !!!!!"





