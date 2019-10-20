require 'test_helper'

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @song_id = "2ByKpLuzVB1qmeBRaiTyk3"
  end

  
  test "Should submit a song" do
    post contest_add_song_url, params: { url: "https://open.spotify.com/track/#{@song_id}" }, as: :json
    assert_response 200
    body = JSON.parse(response.body)
    assert_equal @song_id, body[0]["song"]["spotify_id"]
  end

end
