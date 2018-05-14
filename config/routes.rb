Rails.application.routes.draw do
  get 'person/search'
  get '/person/doInvoke', to: 'person#doInvoke'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'person#search'
end
