Rails.application.routes.draw do
  root 'beverages#index'

  # get 'beverages/index'
  get 'beverages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
