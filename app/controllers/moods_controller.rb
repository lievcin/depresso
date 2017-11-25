class MoodsController < ApplicationController

	def index
		@mood = Mood.new
	end

  def new
    @mood = Mood.new
    @moods = Mood.all
  end

	def create
	  @mood = Mood.new(mood_params)

	  respond_to do |format|
	    if @mood.save
	      format.html  { redirect_back(fallback_location: root_path) }
	    else
	      format.html  { redirect_back(fallback_location: root_path) }
	    end
	  end
	end

  def update
    respond_to do |format|
      if @mood.update(mood_params)
        format.html { redirect_to @mood, notice: 'Mood updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

 private

	def mood_params
		params.require(:mood).permit(:score, :notes)
	end

end