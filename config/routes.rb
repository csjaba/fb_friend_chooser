FbFriendChooser::Application.routes.draw do
  root to: "pages#index"

  resources :sessions do
    collection do
      match "fb_friends" => "sessions#fb_friends"
    end
  end

  match "auth/:provider/callback" => "sessions#create"
  match "logout" => "sessions#destroy"
end
