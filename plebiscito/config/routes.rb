Rails.application.routes.draw do
  get "main/index"
  get "main/hola"
  get "search/create"
  get "search/ocreate"
  get "search/vcreate"
  patch "search/vcreate"
  resources :places do
    resources :voters do
      get :votar
      get :notfound
    end
    get :asociado
  end

  devise_for :users
  get 'principal/index'
  root "principal#index"
end
