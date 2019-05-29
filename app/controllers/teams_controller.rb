class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save!

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
    params.require(:teams).permit(:spirit, :rank_scale, :status, :game, :gender_choice)
  end
end
