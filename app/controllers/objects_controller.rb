class ObjectsController < ApplicationController
  before_action :set_object, only: %i[show edit update destroy]

  def index
    @objects = Object.all
  end

  def show
  end

  def new
    @object = Object.new
  end

  def create
    @object = Object.new(object_params)
    if @object.save
      redirect_to @object, notice: 'Object was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @object.update(object_params)
      redirect_to @object, notice: 'Object was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @object.destroy
    redirect_to objects_url, notice: 'Object was successfully destroyed.'
  end

  private
    def set_object
      @object = Object.find(params[:id])
    end

    def object_params
      params.require(:object).permit(:branch_id, :name, :content)
    end
end