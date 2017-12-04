class Mood < ActiveRecord::Base
	scope :ordered_by_date, -> { order(created_at: :desc) }
end