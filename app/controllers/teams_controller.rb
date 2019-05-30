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
    if @team.save!
      redirect_to mates_path

    else
      render :new
    end
  end

  def mates
    @user = current_user
    @friends = @user.friendships
  end

  private

  def team_params
    params.require(:team).permit(:spirit, :rank_scale, :status, :game_id, :gender_choice)
  end
end
