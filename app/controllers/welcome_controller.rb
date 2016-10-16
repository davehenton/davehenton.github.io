class WelcomeController < ApplicationController

  def index
  end

  def landing
  	code = params[:code]
	token_response = HTTParty.post("https://accounts.spotify.com/api/token", body: { grant_type:"authorization_code", code: code, redirect_uri: "http://localhost:3000/welcome/landing", client_id: "e638e9fda4624061ae4662923427484e", client_secret: "b6259502255f40b396e91711ffbf0907" }, header: { authorization: "code" })
	token = token_response["access_token"]
	# my_top = HTTParty.get("https://api.spotify.com/v1/me/top/tracks?limit=6", headers: { "Authorization" => "Bearer " + token })
	# return [my_top["items"][0]["artists"][0]["name"], my_top["items"][0]["name"], my_top["items"][1]["artists"][0]["name"], my_top["items"][1]["name"], my_top["items"][2]["artists"][0]["name"], my_top["items"][2]["name"], my_top["items"][3]["artists"][0]["name"], my_top["items"][3]["name"], my_top["items"][4]["artists"][0]["name"], my_top["items"][4]["name"], my_top["items"][5]["artists"][0]["name"], my_top["items"][5]["name"]]
	state_query = HTTParty.get("https://api.spotify.com/v1/search?q=california&type=track", headers: { "Authorization" => "Bearer " + token })
	p state_query
	@results = state_query["tracks"]["items"]

  end
end


