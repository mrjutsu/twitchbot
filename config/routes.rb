Rails.application.routes.draw do
  resources :dashboards

  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations"}

  devise_scope :user do

    # get :sign_up, to: 'devise/registrations#new'
    get :sign_up, to: 'devise/registrations#new'#, :as => :new_user_session
    get :sign_in, to: 'devise/sessions#new'#, :as => :new_user_session

    get :twitch_auth, to: 'sessions#twitch_auth', as: :twitch_auth
    get :twitch_sign_in, to: 'sessions#twitch_sign_in', as: :twitch_sign_in

    delete :sign_out, to: 'devise/sessions#destroy'#, :as => :destroy_user_session


    # get :change_password, to: 'registrations#change_password'
    # put :change_password, to: 'registrations#update_password'

    # root to: 'dashboards#landing'
    # get :search, to: 'dashboards#search'
    root to: 'dashboards#index'

  end


end
