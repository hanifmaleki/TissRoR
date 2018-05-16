Rails.application.routes.draw do
  get 'project/search'
  get 'project/list'
  get 'project/detail'
  get 'thesis/search'
  get 'thesis/list'
  get 'thesis/detail'
  get 'course/search'
  get 'course/list'
  get 'course/detail'
  get 'static_pages/login'
  post 'static_pages/loggedin'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/home'
  root 'static_pages#login'
  get 'person/search'
  get '/person/doInvoke', to: 'person#doInvoke'
  get '/person/list'
  get 'person/detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
