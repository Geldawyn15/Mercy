class TeamMembershipsController < ApplicationController
  before_action :set_team, only: %i[mates create random_mates]
  skip_before_action :verify_authenticity_token, only: %i[ create delete]

  def mates
    @user = current_user
    friends = @user.friends
    @mems = @team.team_memberships
    indexes = []
    friends.each do |friend|
      @mems.each do |mem|
        indexes << friend.id if friend.id == mem.user_id
      end
    end
    @friends = @user.friends.where.not(id: indexes)
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

  def random_mates

    mems = @team.team_memberships.pluck(:user_id)
    redirect_to team_path(@team) if mems.length == 6


    mates = current_user.friends.pluck(:id)

    friend_friends = []

    mates.each do |friend|
      user = User.find(friend)
      friend_friends << user.friends.where.not(id: mates).pluck(:id)
    end

    friend_friends = friend_friends.flatten.uniq

    friend_friends.first(6 - mems.length).each do |people|
      TeamMembership.new(
        user_id: people,
        team_id: @team.id
      )
    end

    mems = @team.team_memberships.pluck(:user_id)
    redirect_to team_path(@team) if mems.length == 6

    users = User.where(status: "online").pluck(:id)

    lvl1 =  users - mates
    lvl2 = lvl1 - friend_friends

    lvl2.first(6 - mems.length).each do |people|
      TeamMembership.new(
        user_id: people,
        team_id: @team.id
      )
    end
    redirect_to team_path(@team)
  end

  private

  def team_params
    params.require(:team_membership).permit(:user_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
