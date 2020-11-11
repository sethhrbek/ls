Rails.application.routes.draw do
  scope :api do
    resources :leagues
    post 'league-finder' => 'leagues#leagues_in_budget'
  end
end
