class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @games = Game.all
  end

  def create
    p team_params
    @team = Team.new(team_params)
    if @team.save
      TeamMembership.create(mems_params(@team))
      redirect_to mates_path
    else
      redirect_to new_team_path
    end
  end

  def mates
    @user = current_user
    @team = @user.teams.last
    @friends = @user.friendships
  end

  private

  def mems_params(team)
    return { user_id: current_user.id, team_id: team.id }
  end

  def team_params
    params.require(:team).permit(:spirit, :rank_scale, :status, :game_id, :gender_choice)
  end
end
