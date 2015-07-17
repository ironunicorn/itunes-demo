class TracksController < ApplicationController
	before_action :redirect_to_login
	
	def new
		@track = Track.new
		@album = Album.find(params[:album_id])
		@track.album_id = @album.id 
		@all_albums = Album.all
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
		@track = Track.find(params[:id])
		if @track.update(track_params)
			redirect_to track_url(@track)
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
		params.require(:track).permit(:name, :lyrics, :album_id, :bonus)
	end
end
