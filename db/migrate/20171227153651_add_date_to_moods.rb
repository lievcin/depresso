class AddDateToMoods < ActiveRecord::Migration[5.1]
  def change
  	add_column :moods, :mood_date, :date
  	Mood.where(mood_date: nil).each do |mood|
  		mood.update_attributes(mood_date: mood.created_at)
  	end
  end
end
