class MountainsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]

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
    if @mountain.update(mountain_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @mountain = Mountain.find(params[:id])
    @mountain.destroy
    redirect_to dashboard_path
  end

  private

  def mountain_params
    params.require(:mountain).permit(:name, :range, :height, :location, :terrain, :trails, :difficulty, :price, :photo_url)
  end
end
