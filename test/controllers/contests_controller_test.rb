require 'test_helper'

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "test@test.com", password: "password")
    @song_id = "7qH6ICtmf08M8l3bvM27Gc" # A random Spotify song_id to run the test.
  end

  def log_in
    post user_token_url({
      auth: {
        email: @user.email,
        password: @user.password
      }
    })

    parse_response(:jwt)
  end


  # Parse the response and return a specific key
  def parse_response(key)
    JSON.parse(@response.body)[key.to_s]
  end


  test "Should submit a song" do
    post contest_add_song_url, headers: { "Authorization" => "Bearer #{log_in}"}, params: { url: "https://open.spotify.com/track/#{@song_id}" }, as: :json
    assert_response 200
    body = JSON.parse(response.body)
    assert_equal @song_id, body[0]["song"]["spotify_id"]
  end

end
