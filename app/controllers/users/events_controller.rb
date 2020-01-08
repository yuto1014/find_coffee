class Users::EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
    	respond_to do |format|
	      if @event.save!
	        format.html { redirect_to @event, notice: 'Event was successfully created.' }
	        format.json { render :show, status: :created, location: @event }
	        format.js { @status = "success"}
	      else
	        format.html { render :index }
	        format.json { render json: @event.errors, status: :unprocessable_entity }
	        format.js { @status = "fail" }
	      end
	    end
	end

	def destroy
	end

	private
	def event_params
	    params.require(:event).permit(:title, :start, :end)
	end
end
