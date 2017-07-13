Rails.application.routes.draw do

  root 'organizations#index'
  get 'welcome/index'

  resources :organizations do
    resources :org_memberships, only: [:create, :destroy]  do
      resources :memberships, only:[:update]
      # patch('/:id', { to: 'memberships#apr', as: :approve })
      # patch('/:id', { to: 'memberships#rej', as: :reject })
    end
    # namespace :admin do
    #   resources :organizations, only: [:index, :update]
    # end
    resources :events do
      resources :ev_memberships, only: [:create, :destroy]
    end

    resources :reviews
  end

  resources :filters, only: [:create]
  resources :users, except: [:destroy]
  resources :nearby_organizations, only: :index

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end

  resources :orgsessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end


  # root 'welcome#index'

  get('admin/organizations', {to: 'admin/organizations#index', as: :admin_panel})
  patch('/admin/organizations/:organization_id/:id', {to: 'admin/organizations#update', as: :cunt})

  # get('/questions/:id/edit', { to: 'questions#edit', as: :edit_question })
  # patch('/questions/:id', { to: 'questions#update' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
