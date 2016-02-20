Rails.application.routes.draw do
  devise_scope :user do

    get :sign_up, to: 'devise/registrations#new'
    get :sign_in, to: 'devise/sessions#new'
    get :sign_out, to: 'devise/sessions#destroy'

    # get :change_password, to: 'registrations#change_password'
    # put :change_password, to: 'registrations#update_password'

    # root to: 'dashboards#landing'
    # get :search, to: 'dashboards#search'
    root to: 'devise/registrations#new'

  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
end
