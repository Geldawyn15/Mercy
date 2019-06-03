class TeamMembershipsController < ApplicationController
  before_action :set_team, only: %i[mates]
  def mates
    @user = current_user
    @friends = @user.friendships
    # @friends = @friends - @team.team_memberships
  end

  def create
    p POST
    # p team_params
  end

  def destroy
  end

  private

  def team_params
    params.require(:team_membership).permit(:user_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
