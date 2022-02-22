class PagesController < ApplicationController
  def home
    @mountains = Mountain.all
  end
end
