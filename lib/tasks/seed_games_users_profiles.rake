require 'open-uri'
require 'nokogiri'

namespace :db do
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

    lol_rank = %w[bronze silver gold platinium diamond master challenger]
    lol_roles = champions
    lol = Game.create!(name: 'League of Legends', rank_typology: lol_rank, players_quantity: 5, roles: lol_roles)

    puts 'League of Legend created'

    puts '-----------------------------'
    puts 'CREATING 33 USERS'
    puts '-----------------------------'

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

    bourbon = User.create!(username: 'Bourbon', email: 'Jonaschancelier@gmail.com', discord_id:'Bourbon kid*#6910', password:'mercy4all', birthdate:'02/02/1993', langage: 'en', location: 'eu', image: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/36/36362efcd22d2845be1bc5c0edc38cddd14674cb_full.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    yunyun = User.create!(username: 'YunYun', email: 'yunyun@gmail.com', password:'mercy4all', discord_id:'YunYun#9321', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfxrvTwSHdzAj52qmYZ-4_kdg7aAIBkywW8VMu0x7ruEfXDfjX', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    lolonai = User.create!(username: 'Lolonai', email: 'Lolonai@gmail.com', discord_id:'Lolonai#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://profilepicturesdp.com/wp-content/uploads/2018/06/good-profile-picture-girls-2.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    pengorof = User.create!(username: 'Pengorof', email: 'Pengorof@gmail.com', discord_id:'Pengorof#4648', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'http://d38we5ntdyxyje.cloudfront.net/764397/profile/GFWWYHLL_avatar_medium_square.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    taeola = User.create!(username: 'Taeola', email: 'Taeola@gmail.com', discord_id:'Taeola#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy_zMIjntdPWxSv5XgEL3eVAq7yGwit0g5kaRToKZ9hdlZ9XOj', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    whipthan = User.create!(username: 'whipthan', email: 'whipthan@gmail.com', discord_id:'whipthan#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://casanovastyle.com/wp-content/uploads/2019/03/08-Things-You-Should-Never-Do-Over-Text-Message_fight_506921360_portishead1-740x431@2x.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    sneax = User.create!(username: 'SneaX', email: 'SneaX@gmail.com', discord_id:'SneaX#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://photodoto.com/wp-content/uploads/2013/01/54-self-portrait.jpg', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    kayozz = User.create!(username: 'KaYoZz', email: 'KaYoZz@gmail.com', discord_id:'KaYoZz#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://i2-prod.mirror.co.uk/incoming/article2957719.ece/ALTERNATES/s615b/Cheryl-Cole-instagram.png', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    dragonix = User.create!(username: 'Dragonix', email: 'Dragonix@gmail.com', discord_id:'Dragonix#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/614048c0-c5eb-4425-909d-b4b94a056889/d9qu1ct-b6ad9584-9aaf-4a4b-b87f-a98110af8415.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzYxNDA0OGMwLWM1ZWItNDQyNS05MDlkLWI0Yjk0YTA1Njg4OVwvZDlxdTFjdC1iNmFkOTU4NC05YWFmLTRhNGItYjg3Zi1hOTgxMTBhZjg0MTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jAUeHl2r2U6Di5GSyTEOnI6rGINwVxzx9sMhkQynjCI', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    synix = User.create!(username: 'Synix', email: 'Synix@gmail.com', discord_id:'Synix#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://i.pinimg.com/736x/5b/05/7f/5b057f5115df5baef83446732c3ce194.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    drazox = User.create!(username: 'Drazox', email: 'Drazox@gmail.com', discord_id:'Drazox#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://66.media.tumblr.com/ac1e0a540ca9c5e7e828fbd6e71fb7cb/tumblr_pdxj8ebaj41vydp0uo1_250.png', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    heatzy = User.create!(username: 'Heatzy', email: 'Heatzy@gmail.com', discord_id:'Heatzy#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://scontent.cdninstagram.com/vp/bf9c41083c7eef6f6e76f3d3ccd20a6f/5D74BC76/t51.2885-15/e35/s480x480/56968358_630031677458477_3444622263442622323_n.jpg?_nc_ht=scontent-sea1-1.cdninstagram.com', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    zodiack = User.create!(username: 'Zodiack', email: 'Zodiack@gmail.com', discord_id:'Zodiack#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://scontent.cdninstagram.com/vp/fd4817eca11677b168bd13cae011c347/5D67C60A/t51.2885-15/e35/c86.0.907.907a/s480x480/58410033_378916006289311_3242896559221177523_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    kaos = User.create!(username: 'kaos', email: 'kaos@gmail.com', discord_id:'kaos#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://techgirl.co.za/wp-content/uploads/2016/05/girlgamer.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    omega = User.create!(username: 'Omega', email: 'Omega@gmail.com', discord_id:'Omega#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://scontent-vie1-1.cdninstagram.com/vp/708374d9b04974219d4cb2d38e1ea309/5D8CFBB5/t51.2885-19/s320x320/61040251_430466291084769_4993501588770258944_n.jpg?_nc_ht=scontent-vie1-1.cdninstagram.com', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    zaria = User.create!(username: 'Zaria', email: 'Zaria@gmail.com', discord_id:'Zaria#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://thechive.files.wordpress.com/2018/06/these-hot-af-pro-gamer-girls-can-use-our-joysticks-anytime-56-photos-2528.jpg?quality=85&strip=info&w=600', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    gail = User.create!(username: 'Gail', email: 'Gail@gmail.com', discord_id:'Gail#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://scontent-lga3-1.cdninstagram.com/vp/511efcaf870a065337ab5d9fce9be8ad/5D59D230/t51.2885-15/e35/56398539_207045883593586_428885208413621224_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com&se=8', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    uma = User.create!(username: 'uma', email: 'uma@gmail.com', discord_id:'uma#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://scontent.cdninstagram.com/vp/a0153034f70eeb0f2683363e4177e473/5D62C6CA/t51.2885-15/e35/c0.90.720.720/s480x480/25014856_1393237424118756_7273558404612751360_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    edna = User.create!(username: 'Edna', email: 'Edna@gmail.com', discord_id:'Edna#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://api.personality-database.com/profile_images/25516.png', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    faith = User.create!(username: 'Faith', email: 'Faith@gmail.com', discord_id:'Faith#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBOLNT4PxapuOnF1bZYF47M87S87RbOA7UTwEsx9NwsfDle2re', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    ruby = User.create!(username: 'Ruby', email: 'Ruby@gmail.com', discord_id:'Ruby#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://pbs.twimg.com/profile_images/1105697951329017856/1pgq5Jxq.png', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    quinn = User.create!(username: 'quinn', email: 'quinn@gmail.com', discord_id:'quinn#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://www.instagram.com/p/lLLCxeorA2/media/?size=m', gender: 'female', status: 'online')
    puts "#{User.last.username} created"

    okami = User.create!(username: 'Okami', email: 'Okami@gmail.com', discord_id:'Okami#9254', password:'mercy4all', birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://tse4.mm.bing.net/th?id=OIP.pCctGPIEHi5Tp6YpN96caAHaHw', gender: 'male', status: 'online')
    puts "#{User.last.username} created"

    puts '-----------------------------'
    puts 'CREATING 33 OVERWATCH PROFILES'
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

    lolonai_parameters = { user: lolonai, launcher_tag: '28456', platform: 'pc', mainrole: "mei", game: overwatch }
    profile_creation(lolonai_parameters)

    pengorof_parameters = { user: pengorof, launcher_tag: '8156', platform: 'pc', mainrole: "tracer", game: overwatch }
    profile_creation(pengorof_parameters)

    taeola_parameters = { user: taeola, launcher_tag: '28456', platform: 'pc', mainrole: "reinhardt", game: overwatch }
    profile_creation(taeola_parameters)

    whipthan_parameters = { user: whipthan, launcher_tag: '28456', platform: 'pc', mainrole: "moira", game: overwatch }
    profile_creation(whipthan_parameters)

    sneax_parameters = { user: sneax, launcher_tag: '28456', platform: 'pc', mainrole: "ana", game: overwatch }
    profile_creation(sneax_parameters)

    kayozz_parameters = { user: kayozz, launcher_tag: '28456', platform: 'pc', mainrole: "brigitte", game: overwatch }
    profile_creation(kayozz_parameters)

    dragonix_parameters = { user: dragonix, launcher_tag: '28456', platform: 'pc', mainrole: "tracer", game: overwatch }
    profile_creation(dragonix_parameters)

    synix_parameters = { user: synix, launcher_tag: '28456', platform: 'pc', mainrole: "reaper", game: overwatch }
    profile_creation(synix_parameters)

    drazox_parameters = { user: drazox, launcher_tag: '28456', platform: 'pc', mainrole: "widowmaker", game: overwatch }
    profile_creation(drazox_parameters)

    heatzy_parameters = { user: heatzy, launcher_tag: '28456', platform: 'pc', mainrole: "ashe", game: overwatch }
    profile_creation(heatzy_parameters)

    zodiack_parameters = { user: zodiack, launcher_tag: '28456', platform: 'pc', mainrole: "lúcio", game: overwatch }
    profile_creation(zodiack_parameters)

    kaos_parameters = { user: kaos, launcher_tag: '28456', platform: 'pc', mainrole: "bastion", game: overwatch }
    profile_creation(kaos_parameters)

    omega_parameters = { user: omega, launcher_tag: '28456', platform: 'pc', mainrole: "baptiste", game: overwatch }
    profile_creation(omega_parameters)

    zaria_parameters = { user: zaria, launcher_tag: '28456', platform: 'pc', mainrole: "zarya", game: overwatch }
    profile_creation(zaria_parameters)

    gail_parameters = { user: gail, launcher_tag: '28456', platform: 'pc', mainrole: "orisa", game: overwatch }
    profile_creation(gail_parameters)

    uma_parameters = { user: uma, launcher_tag: '28456', platform: 'pc', mainrole: "roadhog", game: overwatch }
    profile_creation(uma_parameters)

    edna_parameters = { user: edna, launcher_tag: '28456', platform: 'pc', mainrole: "torbjörn", game: overwatch }
    profile_creation(edna_parameters)

    faith_parameters = { user: faith, launcher_tag: '28456', platform: 'pc', mainrole: "symmetra", game: overwatch }
    profile_creation(faith_parameters)

    ruby_parameters = { user: ruby, launcher_tag: '28456', platform: 'pc', mainrole: "hanzo", game: overwatch }
    profile_creation(ruby_parameters)

    quinn_parameters = { user: quinn, launcher_tag: '28456', platform: 'pc', mainrole: "winston", game: overwatch }
    profile_creation(quinn_parameters)

    okami_parameters = { user: okami, launcher_tag: '28456', platform: 'pc', mainrole: "pharah", game: overwatch }
    profile_creation(okami_parameters)

    puts '-----------------------------'
    puts 'CREATING 20 TEAMS FOR OVERWATCH'
    puts '-----------------------------'

    10.times do
      Team.create!(spirit: %w[casual competitive].sample, rank_scale: ow_rank.sample, game: overwatch, gender_choice: %w[girls guys mixed].sample, status: "over")
      Team.create!(spirit: %w[casual competitive].sample, rank_scale: ow_rank.sample, game: overwatch, gender_choice: %w[girls guys mixed].sample, status: %w[pending pending pending complete ingame].sample)
    end

    puts '20 teams created'
  end
end
