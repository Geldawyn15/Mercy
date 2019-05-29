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
      redirect_to teams_id_teams_memberships_new_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:teams).permit(:spirit, :rank_scale, :status, :game, :gender_choice)
  end
end
