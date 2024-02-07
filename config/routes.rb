Rails.application.routes.draw do
  root 'pages#home'
  get("/:math/new", to: 'pages#new', as: 'new')
  post("/:math/results", to: 'pages#calculate', as: 'calculate')
end
