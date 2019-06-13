Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        get '/recipes' => "recipes#display"
        resources :recipes, except: [:index] do
          resources :recipesteps, except: [:show]
        end
      end
      resources :recipes, only: [:index]
    end
  end
end
