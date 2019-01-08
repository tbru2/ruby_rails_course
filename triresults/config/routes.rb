Rails.application.routes.draw do
  resources :racers do
    post "entries" => "racers#create_entry"
  end
  resources :races
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
