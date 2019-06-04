class TeamsController < ApplicationController
  before_action :set_team, only: %i[show review]

  def show
    @mems = @team.users if @team
    if @team == false
      redirect_to user_path(current_user.id)
    elsif @team.status == "pending"
      redirect_to team_mates_path(@team.id)
    elsif @team.status == "over"
      redirect_to team_review_path(@team.id)
    end
  end

  def new
    @team = Team.new
    @games = Game.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      TeamMembership.create(mems_params(@team))
      redirect_to team_mates_path(@team)
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
    if Team.pluck(:id).include? params[:team_id].to_i
      @team = Team.find(params[:team_id])
    elsif Team.pluck(:id).include? params[:id].to_i
      @team = Team.find(params[:id])
    else
      @team = false
    end
  end
end
