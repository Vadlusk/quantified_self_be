Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: %i[new edit]
    end
  end
end
