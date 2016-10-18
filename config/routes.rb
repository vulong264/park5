Rails.application.routes.draw do
  resources :messages do
		collection do
			get 'outgoing'
		end
		
		collection do
			get 'incoming'
		end

		member do
			post 'mark_as_read'
		end
end


	#get 'sessions/new', as: :login
	#post 'sessions' => 'sessions#create', as: :submit_login
	#above code is equals to:
	resources :sessions, only: [:new, :create]

	#delete 'sessions/destroy'
	delete 'logout' => 'sessions#destroy'
  resources :users
  root "home#index"
end
