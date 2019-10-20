require 'base64'

class SpotyAPI
  include HTTParty
  base_uri 'https://accounts.spotify.com/api/token'
  
  def initialize(url)
    ## Authorization can be found here:   
    ## https://developer.spotify.com/documentation/general/guides/authorization-guide/
    @id = url.partition('/track/').last
    @access_token
    @data
    authenticate_application
  end


  def search_and_create_byId
    song = search
    create(song)
  end

  def search
    @options = {
      headers: {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{@access_token}"
      }
    }
    @data = self.class.get("https://api.spotify.com/v1/tracks/#{@id}", @options)
  end


  def create data 
    obj = {
      spotify_id: data["id"], 
      title: data["name"],
      artist: data["artists"][0]["name"],
      album: data["album"]["name"],
      length_ms: data["dataduration_ms"],
    }
    Song.find_or_create_by obj
  end


  def authenticate_application
    options = {
      headers: { "Authorization" => "Basic #{base64_token}"},
      body: { grant_type: "client_credentials" }
    }
    response = self.class.post("", options)
    raise response["error"] if !response["error"].nil?
    @access_token = response["access_token"]
  end


  def base64_token
    client_id = Rails.application.credentials[:SPOTIFY_CLIENT_ID]
    client_secret = Rails.application.credentials[:SPOTIFY_CLIENT_SECRET]
    string_to_encode = "#{client_id}:#{client_secret}"
    Base64.strict_encode64(string_to_encode)
  end

end