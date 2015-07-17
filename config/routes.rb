Rails.application.routes.draw do

    root 'users#index', as: :users


    # get "/users" => "users#index", as: :users
    get 'users/new' => 'users#new', as: :new_user
    get '/users/:id' => 'users#show', as: :user_letters 

    post '/' => 'users#create'

    get 'sessions/new' => 'sessions#new', as: :new_session
    
    post 'sessions/new' => 'sessions#create', as: :create_session
    
    get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

    get 'targets/' => 'targets#index', as: :targets

    get "letters/" => "letters#index", as: :letters

    get "letters/new" => "letters#new", as: :new_letter

    post "letters/" => "letters#create"

    get "letters/:id" => "letters#show", as: :letter

    get "letters/:id/edit" => "letters#edit", as: :edit_letter

    patch "letters/:id" => "letters#update"

    delete "letters/:id" => "letters#destroy"
end
