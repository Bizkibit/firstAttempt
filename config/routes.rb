Rails.application.routes.draw do
  get 'users/new'

  get 'users/show'

  # get 'organizations/new'
  #
  # get 'organizations/show'
  #
  # get 'organizations/index'
  #
  # get 'organizations/edit'

  resources :organizations

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
