Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/reset", to: "TokenTransferController#reset"
  post "/transfer", to: "TokenTransferController#transfer"
  get "/get_amounts", to: "TokenTransferController#amount"
end
