Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # To do - Block showcase website to authenticated user => redirect on current daily journey
  #authenticated :user do
   #   root 'user#show', as: :authenticated_root
  #end

  root to: 'pages#home'

  #TODO - Change route so it has not the heroS and work on hero + add all destroy validations when deleting hero in model
  resources :heros, except: [:index]

  resources :daily_journeys, only: [:index, :show, :edit, :update]

  get 'daily_journeys/today', to: 'daily_journeys#show_today_journey', as: :daily_journey_today

  resources :sleep_logs, only: [ :edit, :update ]

  resources :weight_logs, only: [ :edit, :update ]

  resources :activity_logs, only: [ :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
