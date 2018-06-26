Rails.application.routes.draw do
  get 'favourite/toggle'
  get 'favourite/remove'
  get 'favourite/show'
  get 'favourite/add'
  get 'project/search'
  get 'project/list'
  get 'project/detail'
  get 'project/addFav'
  get 'project/removeFav'
  get 'thesis/search'
  get 'thesis/list'
  get 'thesis/detail'
  get 'course/search'
  get 'course/list'
  get 'course/detail'
  #get 'static_pages/login'
  #post 'static_pages/loggedin'
  #post 'static_pages/create'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/home'
  #get 'static_pages/signup'
  #get 'static_pages/logout'
  root 'static_pages#home'

  get    '/signup',  to: 'users#signup'
  post '/create', to: 'users#create'
  get    '/login',   to: 'sessions#login'
  post   '/loggedin',   to: 'sessions#loggedin'
  delete '/logout',  to: 'sessions#logout'
  get 'person/search'
  #get '/person/doInvoke', to: 'person#doInvoke'
  get '/person/list'
  get 'person/detail'
  get 'course/profFind'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
