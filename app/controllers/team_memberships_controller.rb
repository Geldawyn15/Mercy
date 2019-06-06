class TeamMembershipsController < ApplicationController
  before_action :set_team, only: %i[mates create loading]
  skip_before_action :verify_authenticity_token, only: %i[ create delete]

  def mates
    redirect_to team_path(@team) if @team.status == "complete"

    @user = current_user
    friends = @user.friends.uniq
    mems = @team.team_memberships.pluck(:user_id)
    @mems = User.where(id: mems)

    indexes = []
    friends.each do |friend|
      @mems.each do |mem|
        indexes << friend.id if friend.id == mem.id
      end
    end
    temp = @user.friends.where.not(id: indexes)
    @friends = @user.friends.where(id: temp).order(username: :asc).uniq
  end

  def create
    head :bad_request if @team.team_memberships.length == 6

    membership = TeamMembership.new(team_params)
    if membership.save
      user = User.find(team_params["user_id"])
      user.status = "ingame"
      user.save!
      head :created
    else
      head :bad_request
    end
  end

  def delete
    membership = TeamMembership.where(team_params)

    if TeamMembership.destroy(membership[0].id)
      user = User.find(team_params["user_id"])
      user.status = "online"
      user.save!
      head :ok
    else
      head :bad_request
    end
  end

  def not_full(mems)
    return true if mems.length != 6
  end

  def loading
    mems = @team.team_memberships.pluck(:user_id)

    # get friends of friends
    if not_full(mems)
      mates = current_user.friends.pluck(:id)

      friend_friends = []

      mates.each do |friend|
        user = User.find(friend)
        friend_friends << user.friends.where.not(id: mates).pluck(:id)
      end

      friend_friends = friend_friends.flatten.uniq
      make_team(friend_friends, mems)

      #  get most endorsed that aren't your friends or your friends friends

      mems = @team.team_memberships.pluck(:user_id)
      if not_full(mems)
        users = User.where(status: "online").pluck(:id)

        lvl1 =  users - mates
        lvl2 = lvl1 - friend_friends

        lvl3 = User.where(id: lvl2).joins(:user_reviews).where("user_reviews.endorse = ?", true).pluck(:id)

        lvl3 = lvl3.flatten.uniq

        make_team(lvl3, mems)

        # get randoms

        mems = @team.team_memberships.pluck(:user_id)
        if not_full(mems)
          last_resorts = lvl3 - mems
          make_team(last_resorts, mems)
        end

      end
    end

    mems = @team.team_memberships.pluck(:user_id)
    @mems = User.where(id: mems)
    @team.status = "complete"
    @team.save!
  end

  private

  def make_team(mates, mems)
    mates.first(6 - mems.length).each do |people|
      next if people == current_user.id

      TeamMembership.create(
        user_id: people,
        team_id: @team.id
      )
    end
  end

  def team_params
    params.require(:team_membership).permit(:user_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
