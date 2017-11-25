class MoodsController < ApplicationController
require 'net/http'

	def index
		@mood = Mood.new
		@quote ||= get_quote_of_the_day
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

	def get_quote_of_the_day
		url = 'http://quotes.rest/qod.json?category=inspire'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		quote = JSON.parse(response)
		quote["contents"]["quotes"][0]["quote"]
	end

end