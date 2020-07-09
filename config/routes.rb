Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only:[:new,:index,:show, :update, :edit] do
  	 member do
     get :followings, :followers
     resources :relationships,only: [:create,:destroy]
    end
   end
  resources :books do
	resource :favorites,only: [:create,:destroy]
	resource :book_comments,only: [:create,:destroy]
  end

  
end