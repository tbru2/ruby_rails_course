Rails.application.routes.draw do
  resources :racers do
    post "entries" => "racers#create_entry"
  end
  resources :races do
    resources :entrants
  end
  
  get "/api/races" => "api/races#index"
  get "/api/races/:race_id" => "api/races#show"
  get "/api/races/:race_id/results" => "api/races#results_index"
  get "/api/races/:race_id/results/:id" => "api/races#results_show"
  get "/api/racers" => "api/racers#index"
  get "/api/racers/:id" => "api/racers#show"
  get "/api/racers/:racer_id/entries" => "api/racers#entries_index"
  get "/api/racers/:racer_id/entries/:id" => "api/racers#entries_show"

  post "/api/races" => "api/races#create"

  put "/api/races/:race_id" => "api/races#update"

  patch "/api/races/:race_id" => "api/races#update"
  patch "/api/races/:race_id/results/:id" => "api/races#update_results"

  delete "/api/races/:race_id" => "api/races#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
