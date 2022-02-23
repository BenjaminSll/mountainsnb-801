class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  def new
    @mountain = Mountain.new
  end

  def create
    @mountain = Mountain.new(mountain_params)
    @mountain.user = current_user
    if @mountain.save
      redirect_to mountain_path(@mountain)
    else
      render :new
    end
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    @mountain = Mountain.find(params[:id])
    @mountain.update(params[:mountain])
  end

  def destroy
    @mountain = Mountain.find(params[:id])
    @mountain.destroy
    redirect_to mountains_path
  end

  private

  def mountain_params
    params.require(:mountain).permit(:name, :range, :height, :location, :terrain, :trails, :difficulty, :price, :photo)
  end
end
