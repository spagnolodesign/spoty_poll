Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get '/contest', to: 'contests#show', as: 'contest'
  get '/contest/selections', to: 'contests#show_contest_selections', as: 'contest-selections'
  get '/contest/ranking', to: 'contests#show_contest_ranking', as: 'contest-ranking'
  post '/contest/song', to: 'contests#add_song', as: 'contest-add-song'
  delete '/contest/song/:id' => 'contests#destroy_selection', as: 'contest-destroy-selection'
  #TODO Voting route
end
