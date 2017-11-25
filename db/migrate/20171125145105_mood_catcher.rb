class MoodCatcher < ActiveRecord::Migration[5.1]
  def change
    create_table :moods do |t|
    	t.decimal :mood_score
    	t.text :notes
    	t.timestamps
    end
  end
end