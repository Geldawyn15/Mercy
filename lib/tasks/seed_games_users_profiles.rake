require 'open-uri'
require 'nokogiri'

  namespace :db  do
  desc 'it launches the seeds for games, users, profiles and teams'

  task :seed1 do

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
    ow_roles = %w[bastion dVa genji hanzo junkrat lúcio mccree mei mercy orisa pharah reaper reinhardt roadhog soldier76 sombra symmetra torbjörn tracer widowmaker winston zarya zenyatta ana ashe baptiste brigitte doomfist moira wreckingball]
    overwatch = Game.create!(name: 'overwatch', rank_typology: ow_rank, players_quantity: 6, roles: ow_roles)

    puts 'Overwatch Game created'

    csgo_rank = ['silver I', 'silver II', 'silver III', 'silver IV', 'silver Elite', 'silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Gold Nova Guardian I','Gold Nova Guardian II', 'Master Guardian Elite', 'Distinguished Master Guardian', 'Legendary Eagle', 'Legendary Eagle Master', 'Supreme Master First Class', 'The Global Elite']
    csgo_roles = nil
    csgo = Game.create!(name: 'CS:Go', rank_typology: csgo_rank, players_quantity: 5, roles: csgo_roles)

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
    lol = Game.create!(name: 'League of Legends', rank_typology: lol_rank, players_quantity: 5, roles: lol_roles)

    puts 'League of Legend created'

    puts '-----------------------------'
    puts 'CREATING 13 USERS'
    puts '-----------------------------'

    charlycade = User.create!(username: 'CHARLYCADE', email: 'charlinem@live.fr', password:'mercy4all', discord_id:'CharlyCade#9981' ,birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://data.whicdn.com/images/299530921/large.png', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    bimblor = User.create!(username: 'bimblor', email: 'bimblor@gmail.com', password:'mercy4all', discord_id:'Bimblor#3201', birthdate:'28/05/1995', langage: 'en', location: 'us', image: 'https://avatarfiles.alphacoders.com/105/thumb-105223.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    platinummad = User.create!(username: 'PlatinumMad', email: 'platinummad@gmail.com', password:'mercy4all', discord_id:'Platinum_Mad#3935', birthdate:'21/05/1995', langage: 'en', location: 'us', image: 'https://www.gamerbraves.com/wp-content/uploads/2017/04/my-hero-academia-smash-tap-app-icon.png', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    sonchucks = User.create!(username: 'Sonchucks', email: 'sonchucks@gmail.com', password:'mercy4all', discord_id:'Sonchucks#1734', birthdate:'29/05/1990', langage: 'en', location: 'us', image: 'http://pre14.deviantart.net/2f88/th/pre/i/2017/014/e/0/overwatch___reinhardt__player_icon__by_yoshinoyoshie-davffz6.png', gender: 'male', status: 'ingame')
    puts "#{User.last.username} created"

    oma = User.create!(username: 'Oma', email: 'oma@gmail.com', password:'mercy4all', discord_id:'Oma#9261', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://lincolnpropertycompany.co.uk/wp-content/uploads/2017/05/Kurt-Profile-Image-Square-Brick-1024x1024.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    oten = User.create!(username: 'Oten', email: 'oten@gmail.com', password:'mercy4all', discord_id:'Oten#1848', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://d38we5ntdyxyje.cloudfront.net/771779/profile/WURUQDJR_avatar_medium_square.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    sakiminora = User.create!(username: 'SakiMinora', email: 'sakiminora@gmail.com', discord_id:'Saki Minora#2788', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://www.tamarvalleygirl.com/wp-content/uploads/2016/11/Clair-Wellsbury-Nye-TamarValleyGirl-profile-square.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    starkdouxlol = User.create!(username: 'StarkDOUXlol', email: 'starkdouxlol@gmail.com', discord_id:'Starku-Sama#7037', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8nTSQmtT23ID-Z-SpUxF7-fGu0T03lafX22rfk0YLHHg5r8C1Jw', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    adrean = User.create!(username: 'Adrean', email: 'adrean@gmail.com', password:'mercy4all', discord_id:'Adrean#6804', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://www.thesweetbeastblog.com/wp-content/uploads/em-profile-square.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    kratkiller = User.create!(username: 'Kratkiller', email: 'kratkiller@gmail.com', password:'mercy4all', discord_id:'Kratkiller#7277', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://fusion-therapies.co.uk/wp-content/uploads/2017/03/Beki-Profile-Square.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    kyo = User.create!(username: 'Kyo', email: 'kyo@gmail.com', password:'mercy4all', discord_id:'Kyo#8128', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://d38we5ntdyxyje.cloudfront.net/1061631/profile/YGERHLET_avatar_medium_square.jpg', gender: 'female', status: 'away')
    puts "#{User.last.username} created"

    yunyun = User.create!(username: 'YunYun', email: 'yunyun@gmail.com', password:'mercy4all', discord_id:'YunYun#9321', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://elnuevosol.net/wp-content/uploads/2018/12/Jessica-Wells-483x500.png', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    bourbon = User.create!(username: 'Bourbon', email: 'Jonaschancelier@gmail.com', discord_id:'Bourbon kid*#6910', password:'mercy4all', birthdate:'02/02/1993', langage: 'en', location: 'eu', image: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/36/36362efcd22d2845be1bc5c0edc38cddd14674cb_full.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    puts '-----------------------------'
    puts 'CREATING 13 OVERWATCH PROFILES'
    puts '-----------------------------'

    def profile_creation(user_parameters)
      profile_url = "https://ow-api.com/v1/stats/#{user_parameters[:platform]}/#{user_parameters[:user].location}/#{user_parameters[:user].username}-#{user_parameters[:launcher_tag]}/profile"
      profile = open(profile_url).read
      profile_json = JSON.parse(profile)
      complete_url = "https://ow-api.com/v1/stats/#{user_parameters[:platform]}/#{user_parameters[:user].location}/#{user_parameters[:user].username}-#{user_parameters[:launcher_tag]}/complete"
      complete = open(complete_url).read
      complete_json = JSON.parse(complete)
      main_hero_url = "https://ow-api.com/v1/stats/#{user_parameters[:platform]}/#{user_parameters[:user].location}/#{user_parameters[:user].username}-#{user_parameters[:launcher_tag]}/complete"
      main_hero = open(main_hero_url).read
      main_hero_json = JSON.parse(main_hero)
      complete_json['level']
      Profile.create!(game_id: user_parameters[:game].id, user_id: user_parameters[:user].id, launcher_tag: user_parameters[:launcher_tag], rank: complete_json['rating'], mainrole: user_parameters[:mainrole], profile: profile_json, complete: complete_json, main_hero: main_hero_json)
      puts "#{user_parameters[:user].username} overwatch profile created"
    end

    charlycade_parameters = { user: charlycade, launcher_tag: '2422', platform: 'pc', mainrole: 'dVa', game: overwatch }
    profile_creation(charlycade_parameters)

    bimblor_parameters = { user: bimblor, launcher_tag: '1842', platform: 'pc', mainrole: 'reinhardt', game: overwatch }
    profile_creation(bimblor_parameters)

    platinummad_parameters = { user: platinummad, launcher_tag: '1533', platform: 'pc', mainrole: 'zenyatta', game: overwatch }
    profile_creation(platinummad_parameters)

    sonchucks_parameters = { user: sonchucks, launcher_tag: '1458', platform: 'pc', mainrole: 'mei', game: overwatch }
    profile_creation(sonchucks_parameters)

    oma_parameters = { user: oma, launcher_tag: '21712', platform: 'pc', mainrole: 'tracer', game: overwatch }
    profile_creation(oma_parameters)

    oten_parameters = { user: oten, launcher_tag: '2998', platform: 'pc', mainrole: 'mercy', game: overwatch }
    profile_creation(oten_parameters)

    sakiminora_parameters = { user: sakiminora, launcher_tag: '2910', platform: 'pc', mainrole: 'ana', game: overwatch }
    profile_creation(sakiminora_parameters)

    starkdouxlol_parameters = { user: starkdouxlol, launcher_tag: '2250', platform: 'pc', mainrole: 'winston', game: overwatch }
    profile_creation(starkdouxlol_parameters)

    adrean_parameters = { user: adrean, launcher_tag: '2939', platform: 'pc', mainrole: 'mccree', game: overwatch }
    profile_creation(adrean_parameters)

    kratkiller_parameters = { user: kratkiller, launcher_tag: '2173', platform: 'pc', mainrole: 'ana', game: overwatch }
    profile_creation(kratkiller_parameters)

    kyo_parameters = { user: kyo, launcher_tag: '21185', platform: 'pc', mainrole: 'genji', game: overwatch }
    profile_creation(kyo_parameters)

    yunyun_parameters = { user: yunyun, launcher_tag: '2662', platform: 'pc', mainrole: 'soldier76', game: overwatch }
    profile_creation(yunyun_parameters)

    bourbon_parameters = { user: bourbon, launcher_tag: '21332', platform: 'pc', mainrole: 'dVa', game: overwatch }
    profile_creation(bourbon_parameters)

    puts '-----------------------------'
    puts 'CREATING 8 TEAMS FOR OVERWATCH'
    puts '-----------------------------'

    8.times do
      Team.create!(spirit: %w[casual competitive].sample, rank_scale: ow_rank.sample, game: overwatch, gender_choice: %w[girls guys mixed].sample)
    end

    puts '8 teams created'
  end
end
