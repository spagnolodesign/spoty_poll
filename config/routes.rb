Rails.application.routes.draw do
  get '/contest', to: 'contests#current_contest', as: 'contest'
  get '/contest/selections', to: 'contests#current_contest_selections', as: 'contest-selections'
end
