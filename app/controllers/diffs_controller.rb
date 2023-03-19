class DiffsController < ApplicationController
  before_action :set_diff, only: %i[show edit update destroy]

  def index
    @diffs = Diff.all
  end

  def show
  end

  def new
    @diff = Diff.new
  end

  def create
    @diff = Diff.new(diff_params)
    if @diff.save
      redirect_to @diff, notice: 'Diff was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diff.update(diff_params)
      redirect_to @diff, notice: 'Diff was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @diff.destroy
    redirect_to diffs_url, notice: 'Diff was successfully destroyed.'
  end

  private
    def set_diff
      @diff = Diff.find(params[:id])
    end

    def diff_params
      params.require(:diff).permit(:old_object_id, :new_object_id, :diff_content)
    end
end
