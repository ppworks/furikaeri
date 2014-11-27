Rails.application.routes.draw do
  resources :projects, only: [:new, :create, :show], param: :key do
    resources :issues, only: [:create, :destroy]
  end
  root to: 'pages#top'
end
