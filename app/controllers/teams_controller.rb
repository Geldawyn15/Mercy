class TeamsController < ApplicationController
  before_action :set_team, only: %i[review]

  def show
    @team = Team.find(params[:id])
    @mems = @team.team_memberships
  end

  def new
    @team = Team.new
    @games = Game.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      TeamMembership.create(mems_params(@team))
      redirect_to mates_path
    else
      redirect_to new_team_path
    end
  end

  def review
    @team_review = TeamReview.new
  end

  private

  def mems_params(team)
    return { user_id: current_user.id, team_id: team.id }
  end

  def team_params
    params.require(:team).permit(:spirit, :rank_scale, :status, :game_id, :gender_choice)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
