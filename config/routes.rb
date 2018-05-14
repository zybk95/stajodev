Rails.application.routes.draw do

  root 'number#index'
  get 'number/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
