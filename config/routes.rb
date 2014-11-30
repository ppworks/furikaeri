Rails.application.routes.draw do
  resources :projects, only: [:new, :create, :update, :show], param: :key, path: '' do
    resources :issues, only: [:create, :destroy] do
      put :sort
    end
    resource :pusher_authentication, only: [:create]
  end
  root to: 'pages#top'
end
