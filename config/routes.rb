Rails.application.routes.draw do
  root "articles#index"
  get "/articles/:id", to: "articles#details", as: "article"
end
