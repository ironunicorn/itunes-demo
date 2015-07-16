class TracksController < ApplicationController

	def new
		@track = Track.new
		@album = Album.find(params[:album_id])
	end

	def create
		@track = Track.new(track_params)
		if @track.save
			redirect_to tracks_url
		else
			flash.now[:errors] = @track.errors.full_messages
			render 'new'
		end
	end

	def index
		@tracks = Track.all 
	end

	def show
		@track = Track.find(params[:id])
	end

	def edit
		@track = Track.find(params[:id])
	end

	def update
		@track = Track.find
		if @track.update(track_params)
			redirect_to track_url(track)
		else
			flash.now[:errors] = @track.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		track = Track.find(params[:id])
		track.destroy
		redirect_to tracks_url
	end

	private

	def track_params
		params.permit(:track).require(:name, :lyrics, :album_id)
	end
end
