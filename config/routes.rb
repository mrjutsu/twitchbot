Rails.application.routes.draw do
  resources :dashboards
  devise_scope :user do

    # get :sign_up, to: 'devise/registrations#new'
    get :sign_up, to: 'devise/registrations#new'#, :as => :new_user_session
    delete :sign_out, to: 'devise/sessions#destroy'#, :as => :destroy_user_session

    get :twitch, to: 'devise/sessions#twitch'

    # get :change_password, to: 'registrations#change_password'
    # put :change_password, to: 'registrations#update_password'

    # root to: 'dashboards#landing'
    # get :search, to: 'dashboards#search'
    root to: 'dashboards#index'

  end


  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations"}
end
