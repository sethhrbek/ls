Rails.application.routes.draw do
  scope :api do
    resources :leagues
  end
end
