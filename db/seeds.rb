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
puts 'CREATING 13 USERS'
puts '-----------------------------'

charlycade = User.create!(username: 'charlycade', email: 'charlinem@livefr', password:'mercy4all', discord_id:'CharlyCade#9981' ,birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://data.whicdn.com/images/299530921/large.png', gender: 'f')
puts 'charlycade created'

bimblor = User.create!(username: 'bimblor', email: 'bimblor@gmail.com', password:'mercy4all', discord_id:'Bimblor#3201', birthdate:'28/05/1995', langage: 'en', location: 'us', image: 'https://avatarfiles.alphacoders.com/105/thumb-105223.jpg', gender: 'm')
puts 'bimblor created'

platinumbmad = User.create!(username: 'PlatinumbMad', email: 'platinumbmad@gmail.com', password:'mercy4all', discord_id:'Platinum_Mad#3935', birthdate:'21/05/1995', langage: 'en', location: 'us', image: 'https://www.gamerbraves.com/wp-content/uploads/2017/04/my-hero-academia-smash-tap-app-icon.png', gender: 'm')
puts 'PlatinumbMad created'

sonchucks = User.create!(username: 'Sonchucks', email: 'sonchucks@gmail.com', password:'mercy4all', discord_id:'Sonchucks#1734', birthdate:'29/05/1990', langage: 'en', location: 'us', image: 'http://pre14.deviantart.net/2f88/th/pre/i/2017/014/e/0/overwatch___reinhardt__player_icon__by_yoshinoyoshie-davffz6.png', gender: 'm')
puts 'Sonchucks created'

oma = User.create!(username: 'Oma', email: 'oma@gmail.com', password:'mercy4all', discord_id:'Oma#9261', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://lincolnpropertycompany.co.uk/wp-content/uploads/2017/05/Kurt-Profile-Image-Square-Brick-1024x1024.jpg', gender: 'm')
puts 'Oma created'

oten = User.create!(username: 'oten', email: 'oten@gmail.com', password:'mercy4all', discord_id:'Oten#1848', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://d38we5ntdyxyje.cloudfront.net/771779/profile/WURUQDJR_avatar_medium_square.jpg', gender: 'f')
puts 'oten created'

sakiminora = User.create!(username: 'sakiminora', email: 'sakiminora@gmail.com', discord_id:'Saki Minora#2788', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://www.tamarvalleygirl.com/wp-content/uploads/2016/11/Clair-Wellsbury-Nye-TamarValleyGirl-profile-square.jpg', gender: 'f')
puts 'sakiminora created'

starkdouxlol = User.create!(username: 'StarkDOUXlol', email: 'starkdouxlol@gmail.com', discord_id:'Starku-Sama#7037', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8nTSQmtT23ID-Z-SpUxF7-fGu0T03lafX22rfk0YLHHg5r8C1Jw', gender: 'f')
puts 'StarkDOUXlol created'

adrean = User.create!(username: 'adrean', email: 'adrean@gmail.com', password:'mercy4all', discord_id:'Adrean#6804', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://www.thesweetbeastblog.com/wp-content/uploads/em-profile-square.jpg', gender: 'f')
puts 'adrean created'

krakiller = User.create!(username: 'krakiller', email: 'krakiller@gmail.com', password:'mercy4all', discord_id:'Kratkiller#7277', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://fusion-therapies.co.uk/wp-content/uploads/2017/03/Beki-Profile-Square.jpg', gender: 'f')
puts 'krakiller created'

kyo = User.create!(username: 'kyo', email: 'kyo@gmail.com', password:'mercy4all', discord_id:'Kyo#8128', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://d38we5ntdyxyje.cloudfront.net/1061631/profile/YGERHLET_avatar_medium_square.jpg', gender: 'f')
puts 'kyo created'

yunyun = User.create!(username: 'yunyun', email: 'yunyun@gmail.com', password:'mercy4all', discord_id:'YunYun#9321', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://elnuevosol.net/wp-content/uploads/2018/12/Jessica-Wells-483x500.png', gender: 'f')
puts 'yunyun created'

bourbon = User.create!(username: 'bourbon', email: 'Jonaschancelier@gmail.com', discord_id:'Bourbon kid*#6910', password:'mercy4all', birthdate:'02/02/1993', langage: 'en', location: 'eu', image: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/36/36362efcd22d2845be1bc5c0edc38cddd14674cb_full.jpg', gender: 'm')
puts 'bourbon created'

puts '-----------------------------'
puts 'CREATING 13 OVERWATCH PROFILES'
puts '-----------------------------'

def profile_creation(user, launcher_tag, platform, mainrole)
end

charlycade_parameters = { user: charlycade, launcher_tag: '2422', platform: 'pc', mainrole: 'dVa' }


profile_url = "https://ow-api.com/v1/stats/#{:platform}/#{:user.location}/#{:user.username.upcase}-#{:launcher_tag}/profile"
profile = open(profile_url).read
profile_json = JSON.parse(profile)
complete_url = "https://ow-api.com/v1/stats/#{:platform}/#{:user.location}/#{:user.username.upcase}-#{:launcher_tag}/complete"
complete = open(complete_url).read
complete_json = JSON.parse(complete)
main_hero_url = "https://ow-api.com/v1/stats/#{:platform}/#{:user.location}/#{:user.username.upcase}-#{:launcher_tag}/complete"
main_hero = open(main_hero_url).read
main_hero_json = JSON.parse(main_hero)

Profile.create(game_id: overwatch.id, user_id: :user.id, launcher_tag: :launcher_tag, rank: complete_json['rating'], mainrole: :mainrole, profile: profile_json, complete: complete_json, main_hero: main_hero_json)

puts 'charline overwatch profile created'
#-----------------------------------------
user = bimblor
launcher_tag = '1842'
platform = 'pc'
mainrole = 'Rein'

profile_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/profile"
profile = open(profile_url).read
profile_json = JSON.parse(profile)
complete_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
complete = open(complete_url).read
complete_json = JSON.parse(complete)
main_hero_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
main_hero = open(main_hero_url).read
main_hero_json = JSON.parse(main_hero)

Profile.create(game_id: overwatch.id, user_id: charline.id, launcher_tag: launcher_tag, rank: complete_json['rating'], mainrole: mainrole, profile: profile_json, complete: complete_json, main_hero: main_hero_json)

puts 'bimblor overwatch profile created'
#-----------------------------------------
user = platinumbmad
launcher_tag = '1533'
platform = 'pc'
mainrole = 'flex'

profile_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/profile"
profile = open(profile_url).read
profile_json = JSON.parse(profile)
complete_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
complete = open(complete_url).read
complete_json = JSON.parse(complete)
main_hero_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
main_hero = open(main_hero_url).read
main_hero_json = JSON.parse(main_hero)

Profile.create(game_id: overwatch.id, user_id: charline.id, launcher_tag: launcher_tag, rank: complete_json['rating'], mainrole: mainrole, profile: profile_json, complete: complete_json, main_hero: main_hero_json)

puts 'platinumbmad overwatch profile created'
#-----------------------------------------
user = platinumbmad
launcher_tag = '1533'
platform = 'pc'
mainrole = 'flex'

profile_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/profile"
profile = open(profile_url).read
profile_json = JSON.parse(profile)
complete_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
complete = open(complete_url).read
complete_json = JSON.parse(complete)
main_hero_url = "https://ow-api.com/v1/stats/#{platform}/#{user.location}/#{user.username.upcase}-#{launcher_tag}/complete"
main_hero = open(main_hero_url).read
main_hero_json = JSON.parse(main_hero)

Profile.create(game_id: overwatch.id, user_id: charline.id, launcher_tag: launcher_tag, rank: complete_json['rating'], mainrole: mainrole, profile: profile_json, complete: complete_json, main_hero: main_hero_json)

puts 'platinumbmad overwatch profile created'
#-----------------------------------------


# puts '-----------------------------'
# puts 'CREATING 8 TEAMS FOR OVERWATCH'
# puts '-----------------------------'

# 8.times do
#   Team.create!(spirit: %w[casual, competitive].sample, rank_scale: ow_rank.sample, game: overwatch)
# end

# puts '8 teams created'

# puts '-----------------------------'
# puts 'CREATING 6 TEAM_MEMBERSHIPS FOR EACH TEAM'
# puts '-----------------------------'

# Team.all.each do |team|
#   i = 0
#   6.times do
#     users = User.user_for_game(team.game).sample[6]
#     TeamMembership.create!(user: users[i], team: team)
#     i += 1
#   end
# end

# puts 'all teams completed'
# Team.all.each do |team|
#   puts "#{team}.team_memberships"
# end

# puts '----------------------------------------------------'
# puts 'CREATING 6 TEAM REVIEWS FOR 5 TEAMS WITH STATUS OVER'
# puts '----------------------------------------------------'

# good_reviews = ["That was a hell of a game. You rock girls!!! Let's play together again!", "Love Mercy, beat team mates ever. Thank you for this great game. See you", "You were awesome. We kicked some asses and that was sooo good.", "I loved this game. Love to win, love to have fun, love you. xoxoxoxo", "That was epic. We loose, that's for sure, but I don't care, I had a great time!", "Hey girls, hope you enjoyed it as much as I did!!!!"]
# bad_reviews = ["This was not as good as I wanted it to be. Too bad, next time will be better", "Not that fun today. So sad."]
# mild_reviews = ["It liked it. That was cool", "That was not the best game of my life. hate to loose but nice spirit on the team. Thanks anyway and we'll be better next time", "You cannot win every time. I wish... but no", "The game was OK but one player was not the Mercy spirit. Getting rid of toxicity in gaming is still a long way to go"]

# Team.all.sample(5).each { |team| team.over! }

# over_teams = Team.all_over
# p over_team
# p over_team.count

# #Good reviews#
# over_teams[0..-2].each do |team|
#   j = 0
#   6.times do
#     TeamReview.create!(rating: [4,5].sample, comment: good_reviews[j])
#     j += 1
#   end
# end

# puts "24 good team reviews created"

# #Mild and bad reviews#
# over_teams[-2..-1].each do |team|
#   j = 0
#   2.times do
#     TeamReview.create!(rating: [1,2], comment: bad_reviews[j])
#     j += 1
#   end
#   j = 0
#   4.times do
#     TeamReview.create!(rating: [2,3], comment: mild_reviews[j])
#     j += 1
#   end
# end

# puts "4 bad team reviews created"
# puts "8 mild team reviews created"

# puts '-----------------------------------------------------------'
# puts 'CREATING 6 USER REVIEWS FOR USERS IN TEAMS WITH STATUS OVER'
# puts '-----------------------------------------------------------'

# # user reviews ++ (endorse + add_friend)
# over_teams[0..-2] do |team|
#   UserReview.create!(user: team.team_users[0], add_friend: true, endorse: true)
#   UserReview.create!(user: team.team_users[1], add_friend: true, endorse: true)
#   UserReview.create!(user: team.team_users[2], add_friend: true, endorse: true)
#   UserReview.create!(user: team.team_users[3], add_friend: false, endorse: true)
#   UserReview.create!(user: team.team_users[4], add_friend: false, endorse: true)
#   UserReview.create!(user: team.team_users[5], add_friend: true, endorse: true)
# end

# over_teams[-2..-1] do |team|
#   UserReview.create!(user: team.team_users[0], add_friend: true, endorse: true)
#   UserReview.create!(user: team.team_users[1], add_friend: false, endorse: true)
#   UserReview.create!(user: team.team_users[2], add_friend: false, endorse: true)
#   UserReview.create!(user: team.team_users[3], add_friend: false, endorse: true)
#   UserReview.create!(user: team.team_users[4], add_friend: false, endorse: false, nok: true, nok_respect: true)
#   UserReview.create!(user: team.team_users[5], add_friend: false, endorse: true, nok: true, nok_communication: true, nok_helpfulness: true)
# end

# puts "30 reviews created"
# puts "26 users endorsed"
# puts "14 users added as friends"
# puts "4 users reported as nok"

# puts "14 friendships will automatically be created - not done yet"

# puts "seeds are done !!!!!"





