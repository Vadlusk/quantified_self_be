Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: %i[new edit]
      resources :meals, only: %i[index] do
        get  '/foods',       to: 'meals#show'
        post '/foods(/:id)', to: 'meal_foods#create'
      end
    end
  end
end
