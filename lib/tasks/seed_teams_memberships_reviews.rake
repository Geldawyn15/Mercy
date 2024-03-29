namespace :db do
desc 'it launches the seeds for team memberships, team reviews and user reviews'

  task :seed2 do

    puts '-----------------------------'
    puts 'destroying all previous datas'
    puts '-----------------------------'

    Friendship.destroy_all
    UserReview.destroy_all
    TeamReview.destroy_all
    TeamMembership.destroy_all

    puts '-------------------------------------------------------'
    puts 'CREATING 6 TEAM_MEMBERSHIPS FOR TEAMS COMPLETE AND OVER'
    puts '-------------------------------------------------------'

    Team.where(status: "over").each do |team|
      i = 0
      users = User.user_for_game(team.game).sample(6)
      6.times do
        TeamMembership.create!(user: users[i], team: team)
        i += 1
      end
    end

    Team.where(status: %i[complete ingame]).each do |team|
      i = 0
      users = User.user_for_game_available(team.game).sample(6)
      if users.count == 6
        6.times do
          TeamMembership.create!(user: users[i], team: team)
          i += 1
        end
      else
        team.status = "pending"
      end
    end

    pending_team_average = 0
    Team.where(status: "pending").each { |team| pending_team_average += team.users.count }
    pending_team_average /= Team.where(status: "pending").count unless pending_team_average.zero?

    complete_team_average = 0
    Team.where(status: "complete").each { |team| complete_team_average += team.users.count }
    complete_team_average /= Team.where(status: "complete").count unless complete_team_average.zero?

    ingame_team_average = 0
    Team.where(status: "ingame").each { |team| ingame_team_average += team.users.count }
    ingame_team_average /= Team.where(status: "ingame").count unless ingame_team_average.zero?

    over_team_average = 0
    Team.where(status: "over").each { |team| over_team_average += team.users.count }
    over_team_average /= Team.where(status: "over").count unless over_team_average.zero?

    puts "#{Team.where(status: 'pending').count} teams PENDING with #{pending_team_average} players"
    puts "#{Team.where(status: 'complete').count} teams COMPLETE with #{complete_team_average} players"
    puts "#{Team.where(status: 'ingame').count} teams INGAME with #{ingame_team_average} players"
    puts "#{Team.where(status: 'over').count} teams OVER with #{over_team_average} players"

    puts '--------------------------------------------------'
    puts 'CREATING 6 TEAM REVIEWS FOR TEAMS WITH STATUS OVER'
    puts '--------------------------------------------------'

    good_reviews = ["That was a hell of a game. You rock girls!!! Let's play together again!", "Love Mercy, beat team mates ever. Thank you for this great game. See you", "You were awesome. We kicked some asses and that was sooo good.", "I loved this game. Love to win, love to have fun, love you. xoxoxoxo", "That was epic. We loose, that's for sure, but I don't care, I had a great time!", "Hey girls, hope you enjoyed it as much as I did!!!!"]
    bad_reviews = ["This was not as good as I wanted it to be. Too bad, next time will be better", "Not that fun today. So sad."]
    mild_reviews = ["It liked it. That was cool", "That was not the best game of my life. hate to loose but nice spirit on the team. Thanks anyway and we'll be better next time", "You cannot win every time. I wish... but no", "The game was OK but one player was not the Mercy spirit. Getting rid of toxicity in gaming is still a long way to go"]

    over_teams = Team.where(status: "over")

    #Good reviews#

    i = over_teams.count
    if i <= 2
      over_teams.each do |team|
        j = 0
        6.times do
          members = team.users
          TeamReview.create!(user: team.users[j], team: team, rating: [4,5].sample, comment: good_reviews[j])
          j += 1
        end
      end

    #Mild and bad reviews#
    elsif i > 2
      over_teams[0..-3].each do |team|
        j = 0
        6.times do
          members = team.users
          TeamReview.create!(user: team.users[j], team: team, rating: [4,5].sample, comment: good_reviews[j])
          j += 1
        end
      end

      over_teams[-2..-1].each do |team|
        members = team.users
        j = 0
        k = 0
        2.times do
          TeamReview.create!(user: team.users[k], team: team, rating: [1,2].sample, comment: bad_reviews[j])
          j += 1
          k =+ 1
        end
        j = 0
        4.times do
          TeamReview.create!(user: team.users[k], team: team, rating: [2,3].sample, comment: mild_reviews[j])
          j += 1
          k += 1
        end
      end
    end

    puts "#{TeamReview.count} Team Reviews created"

    puts '---------------------------------------------------------'
    puts 'CREATING USER REVIEWS FOR USERS IN TEAMS WITH STATUS OVER'
    puts '---------------------------------------------------------'

    # user reviews ++ (endorse + add_friend)
    if i <= 2
      over_teams.each do |team|
        team.users.each_with_index do |user, index|
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: true, endorse: true, nok: false) if index !=1
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: true, endorse: true, nok: false) if index !=2
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: true, nok: false) if index !=4
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: true, endorse: true, nok: false) if index !=5
        end
      end
    elsif i > 2
      over_teams[0..i-3].each do |team|
        team.users.each_with_index do |user, index|
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: true, endorse: true, nok: false) if index !=1
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: true, endorse: true, nok: false) if index !=2
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: true, nok: false) if index !=4
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: true, endorse: true, nok: false) if index !=5
        end
      end

      over_teams[-2..-1].each do |team|
        team.users.each_with_index do |user, index|
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[0], add_friend: true, endorse: true, nok: false) if index !=0
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[1], add_friend: false, endorse: true, nok: false) if index !=1
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[2], add_friend: false, endorse: true, nok: false) if index !=2
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[3], add_friend: false, endorse: true, nok: false) if index !=3
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[4], add_friend: false, endorse: false, nok: true, nok_respect: true) if index !=4
          UserReview.create!(team_id: team.id, user: user, user_reviewed: team.users[5], add_friend: false, endorse: true, nok: true, nok_communication: true, nok_helpfulness: true) if index !=5
        end
      end
    end

    puts "#{UserReview.count} User reviews created"
    puts "#{UserReview.where(endorse: true).count} endorsements"
    puts "#{UserReview.where(add_friend: true).count} users added as friends"
    puts "#{UserReview.where(nok: true).count} nok reported"

    puts "#{Friendship.all.count} friendships automatically created"

    puts '-----------------'
    puts 'SEEDS ARE DONE!!!'
    puts '-----------------'
  end
end
