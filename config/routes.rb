Rails.application.routes.draw do

  get 'welcome/index'

  resources :organizations do
    resources :org_memberships do
      resources :memberships, only:[:update]
      # patch('/:id', { to: 'memberships#apr', as: :approve })
      # patch('/:id', { to: 'memberships#rej', as: :reject })
    end
    resources :events
    resources :reviews
    resources :filters, only: [:create]
  end


  resources :users

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  resources :orgsessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  resources :nearby_organizations, only: :index

  # root 'welcome#index'
  root 'organizations#index'

  get 'welcome/sign_in', {to: 'welcome#show', as: :welcome_sign_in}
  # get('/questions/:id/edit', { to: 'questions#edit', as: :edit_question })
  # patch('/questions/:id', { to: 'questions#update' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
