Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get 'pages/charts'
  get 'pages/admin_stats'
  get 'pages/intervention'
  get '/quote/new', to: 'quote#new'
  get '/intervention/building', to: 'intervention#building'
  get '/intervention/battery', to: 'intervention#battery'
  get '/intervention/column', to: 'intervention#column'
  get '/intervention/elevator', to: 'intervention#elevator'
  post '/quote', to: 'quote#create'
  post '/intervention', to: 'intervention#create'
  post '/contact', to: 'contact#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
