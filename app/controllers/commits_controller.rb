class CommitsController < ApplicationController
  before_action :set_commit, only: %i[show edit update destroy]

  def index
    @commits = Commit.all
  end

  def show
  end

  def new
    @commit = Commit.new
  end

  def create
    @commit = Commit.new(commit_params)
    if @commit.save
      redirect_to @commit, notice: 'Commit was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @commit.update(commit_params)
      redirect_to @commit, notice: 'Commit was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @commit.destroy
    redirect_to commits_url, notice: 'Commit was successfully destroyed.'
  end

  private
    def set_commit
      @commit = Commit.find(params[:id])
    end

    def commit_params
      params.require(:commit).permit(:message, :branch_id, :user_id)
    end
end