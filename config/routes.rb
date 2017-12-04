Rails.application.routes.draw do
	root :to => "moods#index"

	resources :moods
	get 'mood_history', to: 'moods#history', as: 'mood_history'

end
