class PinsController < ApplicationController

	def index
	  @pins = Pin.all
	  render :index
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.create(pin_params)

		if @pin.save
			flash[:success] = "Successfully Created!"
			redirect_to pins_path
		else
			# show new page again with error messages. 
			@errors = @pin.errors.full_messages
			render :new
		end

	end

	def update
		@pin = Pin.find_by_id(params[:id])
		@pin.update(pin_params)

		if @pin.save
			flash[:success] = "Successfully Update!"
			redirect_to pins_path
		else
			# show new page again with error messages. 
			@errors = @pin.errors.full_messages
			render :edit
		end
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
		redirect_to pins_path, notice: "Destroyed"
	end

	private
		def pin_params
			pin_params = params.require(:pin).permit(:url, :comment)
		end	

end
