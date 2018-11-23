Rails.application.routes.draw do
  
  devise_for :users
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  namespace 'api' do
    namespace 'v1' do
      post 'auth_user' => 'authentication#authenticate_user'
      resources :alerts
      resources :contacts
    end
  end
  
end
