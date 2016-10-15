class WelcomeController < ApplicationController
  def index
  end

  def landing
	p code = params[:code]
    p @results = query_top_tracks(code)
  end

end

