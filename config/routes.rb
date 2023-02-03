Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'

  get '/register', to: 'users#new'
  # post '/search', to: 'movies#search'
  # <center><%= form_with url: search_path, local: true do |f| %>
  #   <%= f.text_field :search %>
  #   <%= f.label :search, 'Find Movies' %>
  #   <%= f.submit 'Search' %>
  # <% end %><center>


  resources :users, only: [:create, :show] do
    resources :movies, only: [:index, :show]
    member do
      get 'discover'
    end
  end
  
end
