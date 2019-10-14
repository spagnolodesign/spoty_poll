Rails.application.routes.draw do
  get '/contest', to: 'contests#current_contest', as: 'contest'
  get '/contest/songs', to: 'contests#current_contest_selection', as: 'contest-selection'
end
