Rails.application.routes.draw do
  root 'home#index'
  get '/voter-registration', to: 'voter#voter_registration'
  post 'submit-voter-registration', to: "voter#submit_voter_registration"
end
