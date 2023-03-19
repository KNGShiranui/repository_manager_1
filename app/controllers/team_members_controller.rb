class TeamMembersController < ApplicationController
  before_action :set_team_member, only: %i[show edit update destroy]

  def index
    @team_members = TeamMember.all
  end

  def show
  end

  def new
    @team_member = TeamMember.new
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    if @team_member.save
      redirect_to @team_member, notice: 'Team member was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team_member.update(team_member_params)
      redirect_to @team_member, notice: 'Team member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team_member.destroy
    redirect_to team_members_url, notice: 'Team member was successfully destroyed.'
  end

  private
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit(:user_id, :team_id)
    end
end
