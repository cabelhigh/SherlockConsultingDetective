Rails.application.routes.draw do
  post 'note/new'
  get 'note/new'
  get 'note' => 'note#new'
  get 'note/create'
  post 'create' => 'note#create'

  get 'note/show'

  get 'note/edit'

  root 'address#search'

  get '/search' => 'address#search'

  get '/addresses/:id' => 'address#show'
  get '/clues/:id' => 'clue#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
