Rails.application.routes.draw do

  resources :organizations do
    resources :org_memberships
    resources :events
  end

  resources :users

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  resources :orgsessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
