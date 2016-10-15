module WelcomeHelper

	def query_top_tracks(token_code)
		token_response = HTTParty.post("https://accounts.spotify.com/api/token", body: { grant_type:"authorization_code", code: token_code, redirect_uri: "https://still-island-96987.herokuapp.com/users/landing", client_id: ENV['SPOTIFY_CLIENT_ID'], client_secret: ENV['SPOTIFY_CLIENT_SECRET'] }, header: { authorization: "code" })
		token = token_response["access_token"]
		# my_top = HTTParty.get("https://api.spotify.com/v1/me/top/tracks?limit=6", headers: { "Authorization" => "Bearer " + token })
		# return [my_top["items"][0]["artists"][0]["name"], my_top["items"][0]["name"], my_top["items"][1]["artists"][0]["name"], my_top["items"][1]["name"], my_top["items"][2]["artists"][0]["name"], my_top["items"][2]["name"], my_top["items"][3]["artists"][0]["name"], my_top["items"][3]["name"], my_top["items"][4]["artists"][0]["name"], my_top["items"][4]["name"], my_top["items"][5]["artists"][0]["name"], my_top["items"][5]["name"]]
		state_query = HTTParty.get("https://api.spotify.com/v1/search?q=california&type=track", headers: { "Authorization" => "Bearer " + token })
		p state_query
		return state_query
	end
	
end

