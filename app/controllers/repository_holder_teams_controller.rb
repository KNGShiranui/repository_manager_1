class RepositoryHolderTeamsController < ApplicationController
  before_action :set_repository_holder_team, only: %i[show edit update destroy]

  def index
    @repository_holder_teams = RepositoryHolderTeam.all
  end

  def show
  end

  def new
    @repository_holder_team = RepositoryHolderTeam.new
  end

  def create
    @repository_holder_team = RepositoryHolderTeam.new(repository_holder_team_params)
    if @repository_holder_team.save
      redirect_to @repository_holder_team, notice: 'RepositoryHolderTeam was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @repository_holder_team.update(repository_holder_team_params)
      redirect_to @repository_holder_team, notice: 'RepositoryHolderTeam was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @repository_holder_team.destroy
    redirect_to repository_holder_teams_url, notice: 'RepositoryHolderTeam was successfully destroyed.'
  end

  private
    def set_repository_holder_team
      @repository_holder_team = RepositoryHolderTeam.find(params[:id])
    end

    def repository_holder_team_params
      params.require(:repository_holder_team).permit(:repository_id, :team_id)
    end
end
