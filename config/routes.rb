Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/reset", to: "token_transfers#reset"
  post "/transfer", to: "token_transfers#transfer"
  get "/get_amounts", to: "token_transfers#amount"
end
