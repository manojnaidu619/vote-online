Rails.application.routes.draw do
  root 'home#index'
  get '/voter-registration', to: 'voter#voter_registration'
  post 'submit-voter-registration', to: "voter#submit_voter_registration"
  get '/vote-now', to: "voter#vote_now"
  post '/register-vote', to: "voter#register_vote"
  get '/admin', to: "admin#index"
  get '/add-candidate', to: "admin#add_candidate"
  post '/create_candidate', to: "admin#create_candidate"
end
