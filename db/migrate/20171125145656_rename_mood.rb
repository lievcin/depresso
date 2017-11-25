class RenameMood < ActiveRecord::Migration[5.1]
  def change
  	rename_column :moods, :mood_score, :score
  end
end
