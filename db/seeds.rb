require 'open-uri'
require 'nokogiri'

puts '-----------------------------'
puts 'destroying all previous datas'
puts '-----------------------------'

Game.destroy_all
User.destroy_all
Profile.destroy_all
Team.destroy_all
TeamMembership.destroy_all
Friendship.destroy_all
UserReview.destroy_all
TeamReview.destroy_all

puts '-----------------------------'
puts 'CREATING GAMES'
puts '-----------------------------'

puts 'creating Overwatch Game'

ow_rank = %w[bronze silver gold platinium diamond master grandmaster top500]
ow_roles = %w[bastion dVa genji hanzo junkrat lúcio mccree mei mercy orisa pharah reaper reinhardt roadhog soldier76 sombra symmetra torbjörn tracer widowmaker winston zarya zenyatta]
overwatch = Game.create!(name: 'overwatch', rank_typology: ow_rank, players_quantity: 6)

puts 'creating CS:Go Game'

csgo_rank = ['silver I', 'silver II', 'silver III', 'silver IV', 'silver Elite', 'silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Gold Nova Guardian I','Gold Nova Guardian II', 'Master Guardian Elite', 'Distinguished Master Guardian', 'Legendary Eagle', 'Legendary Eagle Master', 'Supreme Master First Class', 'The Global Elite']
csgo_roles = nil
csgo = Game.create!(name: 'overwatch', rank_typology: csgo_rank, players_quantity: 5)

puts 'creating League of Legend'

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

puts '-----------------------------'
puts 'CREATING 3 USERS'
puts '-----------------------------'

puts 'creating charline'
charline = User.create!(username: 'charlycade', email: 'charline@gmail.com', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu')

puts '-----------------------------'
puts 'CREATING OVERWATCH PROFILES'
puts '-----------------------------'

puts 'creating charline overwatch profile'

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

puts '-----------------------------'
puts 'CREATING 25 TEAMS FOR OVERWATCH'
puts '-----------------------------'

25.times do
  Team.create!(spirit: [casual, competitive].sample, rank_scale: ow_rank.sample, game: overwatch)
end

# Team
# TeamMembership
# Friendship
# UserReview
# TeamReview
