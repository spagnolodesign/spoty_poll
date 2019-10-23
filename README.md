# SPOTY POLL
A simple spotify song contest based on api.

* Ruby version
2.6.3
* System dependencies
postgress, imagemagick

* Configuration and database initialization
please run the following command to start the app with some data: 
`bin/rails db:setup` or `rake db:reseed`

* How to run the test suite
`rake test`

* Instructions to play with the app:
  Following the guidelines will help you to submit a song in the contest and to see the song that has the most votes.

  1. First of all we need to authenticate the user (you might use an alredy existing user in the database just for testing)
  `curl -X POST "http://localhost:3000/user_token" -d '{"auth": {"email": "jon@snow.com", "password": "123456"}}' -H "Content-Type: application/json"`

  2. copy the server response, if you are succesfully authenticated you will get a response with the jwt token:`{"jwt":"eyJ0eXAi--3683Jlw"}%` 

  3. Copy the token to set an Authorization Header, with type Bearer for following APi call. (You might want to use PostMan for simplicity)

  ## Api list

  * ACTIVE CONTEST ( An active contest )
    url: `/contest` 
    verb: `GET`

  * CONTEST SELECTIONS ( A list of songs currently added to the contest and whether you       have voted for the song or not )
    url: `/contest/selections` 
    verb: `GET`

  * CONTEST RANKING ( A list of all songs ordered by highest votes )
    url: `/contest/ranking` 
    verb: `GET`

  * ADD A SONG TO THE ACTIVE CONTEST
    url: `http://localhost:3000/contest/song?url=https://open.spotify.com/track/${SONG_ID}`
    verb: `POST`
    ( Please make sure to change the param url SONG_ID in the link above )
    reponse: CONTEST SELECTIONS

  * DELETE A SONG FROM CONTEST
    url: `http://localhost:3000/contest/song/${SONG_ID}`
    verb: `DELETE`


  ## Choices: 

  For image uploading I've used `paperclip` . Since it is not maintained anymore, I won't use it for the production release. This was only for testing purposes. 

  Running a test will fake an authentication with a new user. 
  Please view `/test/controllers/contests_controller_test.rb`
