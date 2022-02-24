class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @mountains = Mountain.where(sql_query, query: "%#{params[:query]}%")
    else
      @mountains = Mountain.all
    end
  end
end
