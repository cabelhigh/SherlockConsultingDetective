Rails.application.routes.draw do
  root 'address#search'

  get '/search' => 'address#search'

  get '/addresses/:id' => 'address#show'
  get '/clues/:id' => 'clue#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
