class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[show edit update destroy]

  def index
    @repositories = Repository.all
  end

  def show
  end

  def new
    @repository = Repository.new
  end

  def create
    @repository = Repository.new(repository_params)
    if @repository.save
      redirect_to @repository, notice: 'Repository was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @repository.update(repository_params)
      redirect_to @repository, notice: 'Repository was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @repository.destroy
    redirect_to repositories_url, notice: 'Repository was successfully destroyed.'
  end

  private
    def set_repository
      @repository = Repository.find(params[:id])
    end

    def repository_params
      params.require(:repository).permit(:name, :description, :user_id, :access_level)
    end
end
