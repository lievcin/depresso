class Mood < ActiveRecord::Base
	scope :ordered_by_date, -> { order(mood_date: :desc) }
end