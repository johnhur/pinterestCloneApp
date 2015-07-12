class PinsController < ApplicationController

	def index
	  @pins = Pin.all
	  render :index
	end

	def new
		@pin = Pin.new
	end

	def create
		Pin.create(pin_params)
		redirect_to "/pins"
	end

	def update
		@pin = Pin.find_by_id(params[:id])
		@pin.update(pin_params)

		redirect_to '/'
	end

	def edit
		@pin = Pin.find_by_id(params[:id])
	end

	def show
		@pin = Pin.find_by_id(params[:id])
	end

	def destroy
		@pin = Pin.find_by_id(params[:id])
		@pin.destroy
		redirect_to '/'
	end

	private
		def pin_params
			pin_params = params.require(:pin).permit(:url, :comment)
		end	

end
