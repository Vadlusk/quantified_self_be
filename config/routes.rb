Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: %i[new edit]
      resources :meals, only: %i[index show] do
        resources :foods, only: %i[index]
        post '/foods(/:id)', to: 'meal_foods#create'
      end
    end
  end
end
