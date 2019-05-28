require 'rest-client'
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
overwatch = Game.create!(name: 'overwatch', rank_type: ow_rank, player_quantity: 6)

puts 'creating CS:Go Game'

csgo_rank = ['silver I', 'silver II', 'silver III', 'silver IV', 'silver Elite', 'silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Gold Nova Guardian I','Gold Nova Guardian II', 'Master Guardian Elite', 'Distinguished Master Guardian', 'Legendary Eagle', 'Legendary Eagle Master', 'Supreme Master First Class', 'The Global Elite']
csgo_roles = nil
csgo = Game.create!(name: 'overwatch', rank_type: csgo_rank, player_quantity: 5)

puts 'creating League of Legend'

# Parsing for lol roles
url_lol_role = 'https://leagueoflegends.fandom.com/wiki/List_of_champions/Position'
response = RestClient.get url_lol_role
noko = Nokogiri::HTML.parse(response)
noko.search('.champion-icon.span a').each do |champion|
  p champion
end
#

lol_rank = %w[bronze silver gold platinium diamond master challenger]
lol_roles = nil
lol = Game.create!(name: 'overwatch', rank_type: csgo_rank, player_quantity: 5)

puts '-----------------------------'
puts 'CREATING 3 USERS'
puts '-----------------------------'

puts 'creating charline'
charline = user.create!(username: 'charlycade', email: 'charline@gmail.com', birthdate:'29/05/1990', langage: 'en', location: 'france')

puts '-----------------------------'
puts 'CREATING OVERWATCH PROFILES'
puts '-----------------------------'

puts 'creating charline overwatch profile'

CHARLYCADE-2422

'https://ow-api.com/v1/stats/pc/eu/CHARLYCADE-2422/profile'
'https://ow-api.com/v1/stats/pc/eu/CHARLYCADE-2422/complete'
'https://ow-api.com/v1/stats/pc/eu/CHARLYCADE-2422//heroes/dVa'

charline_profile = profile.create(game_id: overwatch.id, user_id: charline.id, launcher_tag: '2422')

# User
# Profile
# Team
# TeamMembership
# Friendship
# UserReview
# TeamReview
