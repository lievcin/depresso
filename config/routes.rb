Rails.application.routes.draw do
	root :to => "moods#index"

	resources :moods
end
