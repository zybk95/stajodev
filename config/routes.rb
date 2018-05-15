Rails.application.routes.draw do


  get 'number/index'
  post 'number/index'
  root 'number#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
