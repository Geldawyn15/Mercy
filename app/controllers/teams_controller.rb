class TeamsController < ApplicationController
  before_action :set_team, only: %i[review]
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
      redirect_to mates_path
    else
      redirect_to new_team_path
    end
  end

  def mates
    @user = current_user
    @friends = @user.friendships
  end

  def review
    @team_review = TeamReview.new
  end

  private

  def team_params
    params.require(:team).permit(:spirit, :rank_scale, :status, :game_id, :gender_choice)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
