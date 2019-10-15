Rails.application.routes.draw do
  get '/contest', to: 'contests#show', as: 'contest'
  get '/contest/selections', to: 'contests#show_contest_selections', as: 'contest-selections'
  get '/contest/ranking', to: 'contests#show_contest_ranking', as: 'contest-ranking'
end
