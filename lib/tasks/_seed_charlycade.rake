require 'open-uri'
require 'nokogiri'

namespace :db do
  desc 'seed for the pitch on charlycade profile'

  task :seed3 do

    user = User.where(email: "charlinem@live.fr")
    if user != []
      charlycade = user[0]
      Friendship.where(user: charlycade).destroy_all
      Friendship.where(friend: charlycade).destroy_all
      UserReview.where(user: charlycade).destroy_all
      UserReview.where(user_reviewed: charlycade).destroy_all
      TeamReview.where(user: charlycade).destroy_all
      TeamMembership.where(user: charlycade).destroy_all
      charlycade.destroy!
    end

    puts '------------------------------------'
    puts 'CREATING CHARLYCADE USER AND PROFILE'
    puts '------------------------------------'

    ow_rank = %w[bronze silver gold platinium diamond master grandmaster top500]
    ow_roles = %w[bastion dVa genji hanzo junkrat lúcio mccree mei mercy orisa pharah reaper reinhardt roadhog soldier76 sombra symmetra torbjörn tracer widowmaker winston zarya zenyatta ana ashe baptiste brigitte doomfist moira wreckingball]

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

    charlycade = User.create!(username: 'CHARLYCADE', email: 'charlinem@live.fr', password:'mercy4all', discord_id:'CharlyCade#9981' ,birthdate:'29/05/1990', langage: 'en', location: 'eu', image: 'https://66.media.tumblr.com/0575ce8bfc6af722c09499d4bd781771/tumblr_pspy1butNs1qb5wcd_500.jpg', gender: 'female', status: 'online')
    puts "#{User.last.username} user created"

    charlycade_parameters = { user: charlycade, launcher_tag: '2422', platform: 'pc', mainrole: 'dVa', game: Game.first }
    profile_creation(charlycade_parameters)
    puts "#{User.last.username} profile created"

    puts '--------------------------------------------------------------'
    puts 'CREATING 7 OVER TEAMS FOR CHARLYCADE WITH 5 OTHER TEAM MEMBERS'
    puts '--------------------------------------------------------------'

    charlycade = User.last
    charlycade_team = []
    8.times do
      Team.create!(spirit: %w[casual competitive].sample, rank_scale: ow_rank.sample, game: Game.first, gender_choice: %w[girls guys mixed].sample, status: "over")
      team = Team.last
      charlycade_team << team
      other_members = User.where.not(username: "CHARLYCADE")
      other_members = other_members.sample(5)
      TeamMembership.create!(user: charlycade, team: team)
      i = 0
      5.times do
        TeamMembership.create!(user: other_members[i], team: team)
        i += 1
      end
    end

    puts '8 over teams created with all members'

    charlycade_in_team = []
    charlycade_team.each do |team|
      charlycade_in_team << true if team.users.where(username: "CHARLYCADE")  == User.where(username: "CHARLYCADE")
    end
    charlycade_in_team.uniq!

    if charlycade_in_team == [true]
      puts "all teams have charlycade"
    else
      puts "oh oh there is a problem, charlycade is not in all created teams"
    end

    puts '--------------------------'
    puts 'CREATING OVER TEAM REVIEWS'
    puts '--------------------------'

    good_reviews = ["That was a hell of a game. You rock girls!!! Let's play together again!", "Love Mercy, beat team mates ever. Thank you for this great game. See you", "You were awesome. We kicked some asses and that was sooo good.", "I loved this game. Love to win, love to have fun, love you. xoxoxoxo", "That was epic. We loose, that's for sure, but I don't care, I had a great time!", "Hey girls, hope you enjoyed it as much as I did!!!!"]
    bad_reviews = ["This was not as good as I wanted it to be. Too bad, next time will be better", "Not that fun today. So sad."]
    mild_reviews = ["It liked it. That was cool", "That was not the best game of my life. hate to loose but nice spirit on the team. Thanks anyway and we'll be better next time", "You cannot win every time. I wish... but no", "The game was OK but one player was not the Mercy spirit. Getting rid of toxicity in gaming is still a long way to go"]

    # One bad/mild team review for 6 members
    for j in (0..3) do
      TeamReview.create!(user: charlycade_team[0].users[j], team: charlycade_team[0], rating: [1,2].sample, comment: bad_reviews.sample)
    end
    for j in (4..5) do
      TeamReview.create!(user: charlycade_team[0].users[j], team: charlycade_team[0], rating: [2,3].sample, comment: mild_reviews.sample)
    end

    # One mild/good team review for 6 members
    for j in (0..3) do
      TeamReview.create!(user: charlycade_team[1].users[j], team: charlycade_team[1], rating: [2,3].sample, comment: bad_reviews.sample)
    end
    for j in (4..5) do
      TeamReview.create!(user: charlycade_team[1].users[j], team: charlycade_team[1], rating: [3,4].sample, comment: good_reviews.sample)
    end

    # 6 all good team reviews for 6 members
    for i in (2..7)
      for j in (0..5) do
        TeamReview.create!(user: charlycade_team[i].users[j], team: charlycade_team[i], rating: [4,5].sample, comment: good_reviews.sample)
      end
    end

    puts "team reviews created for charlycade's over teams"

    puts '-------------------------------'
    puts 'CREATING OVER TEAM USER REVIEWS'
    puts '-------------------------------'

    # bad/mild user reviews for 1 team
    charlycade_team[0].users.each_with_index do |user, index|
      team = charlycade_team[0]
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: false, endorse: true, nok: false) if index !=1
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: false, endorse: true, nok: false) if index !=4
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: false, nok: true, nok_respect: true) if index !=2
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: false, endorse: true, nok: true, nok_communication: true, nok_helpfulness: true) if index !=5
    end

    # mild/good user reviews for 1 team
    charlycade_team[1].users.each_with_index do |user, index|
      team = charlycade_team[1]
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: true, endorse: true, nok: false) if index !=5
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: false, endorse: true, nok: false) if index !=2
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: true, nok: false) if index !=4
      UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: false, endorse: false, nok: true, nok_communication: true, nok_helpfulness: true) if index !=1
    end

    # good user reviews for 5 teams
    charlycade_team[2..6].each do |team|
      team.users.each_with_index do |user, index|
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: true, endorse: true, nok: false) if index !=1
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: false, endorse: true, nok: false) if index !=2
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: true, nok: false) if index !=4
        UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: false, endorse: true, nok: false) if index !=5
      end
    end

      puts "user reviews created for charlycade's over teams members"
      puts "Charlycade has submitted #{UserReview.where(user: charlycade).count} reviews"
      puts "Charlycade has endorsed #{UserReview.where(user: charlycade, endorse: true).count} people"
      puts "Charlycade has added #{UserReview.where(user: charlycade, add_friend: true).count} people as friends"
      puts "Charlycade has reported #{UserReview.where(user: charlycade, nok: true).count} people"
      puts " "
      puts "Charlycade was reviewed #{UserReview.where(user_reviewed: charlycade).count} times"
      puts "Charlycade was endorsed #{UserReview.where(user_reviewed: charlycade, endorse: true).count} times"
      puts "Charlycade was added as friend #{UserReview.where(user_reviewed: charlycade, add_friend: true).count} times"
      puts "Charlycade was reported #{UserReview.where(user_reviewed: charlycade, nok: true).count} times"
      puts " "
      puts "Charlycade has now #{Friendship.where(user: charlycade).count} friends"
      puts " "
      puts '-------------------------------'
      puts 'SEEDS FOR THE PITCH ARE DONE!!!'
      puts '-------------------------------'
  end
end
