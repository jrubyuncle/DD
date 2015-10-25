Rails.application.routes.draw do

  root		'posts#index'
	get			'sign_in'		=> 'sessions#new'
	post 		'sign_in'		=> 'sessions#create'
	delete 	'sign_out'	=> 'sessions#destroy'
	
  resources :posts
  resources :users
  resources :tags, except: [:index, :show]
end