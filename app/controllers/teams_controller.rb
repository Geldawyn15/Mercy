class TeamsController < ApplicationController
  def show
    @team = Team.new
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params_team)
    if @team.save!
      redirect_to user_teams_path(@users)
    else
      render :new
    end
  end

  private

  def params_team
    params.require(:teams).permit(:spirit, :rank_scale, :status)
  end
end
