Rails.application.routes.draw do
  resources :posts do
    get '/change-state', to: 'posts#publish_unpublish', as: :publish_unpublish
    resources :comments, except: :show
  end

  root to: redirect('/posts')

  devise_for :users
end
