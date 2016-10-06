Rails.application.routes.draw do
  get 'votes/index'

  get 'votes/search'
  get "main/index"
  get "main/hola"
  get "main/votar"
  get "main/folleto"
  get "search/create"
  get "search/ocreate"
  get "search/ucreate"
  get "search/votar"
  get "statistic/salida"
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
