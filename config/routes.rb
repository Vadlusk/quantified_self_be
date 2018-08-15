Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :foods, only: %i[index show create update]
    end
  end
end
