Rails.application.routes.draw do
  resources :treatment_types
  resources :treatments
  root 'home#index'

  # Home Controller
  get 'welcome' => 'home#welcome'
  get 'all-uk-cities' => 'home#all_uk_cities'
  get 'thank-you' => 'home#thank_you'
  get 'approval-pending' => 'home#approval_pending'
  get 'promotions' => 'home#promotions'

  # Dashboard Controller
  get 'dashboard' => 'dashboard#index'

  # Devise Controller
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions', confirmations: 'confirmations'}

  # Profile Controller
  get 'profile' => 'profile#index', as: 'profile'
  patch 'profile/update-data' => 'profile#update_data', as: 'profile_update'
  patch 'profile/change-password' => 'profile#change_password', as: 'change_password'
  # get 'persons/profile', as: 'user_root'

end
