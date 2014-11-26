Rails.application.routes.draw do
  resources :projects, only: [:new, :create, :show], param: :key
  root to: 'pages#top'
end
