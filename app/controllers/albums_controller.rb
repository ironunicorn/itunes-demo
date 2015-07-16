class AlbumsController < ApplicationController

	def new
		@album = Album.new
		@band = Band.find(params[:band_id])
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			redirect_to albums_url
		else
			flash.now[:errors] = @album.errors.full_messages
			render 'new'
		end
	end

	def index
		@albums = Album.all 
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find
		if @album.update(album_params)
			redirect_to album_url(album)
		else
			flash.now[:errors] = @album.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		album = Album.find(params[:id])
		album.destroy
		redirect_to albums_url
	end

	private

	def album_params
		params.require(:album).permit(:title, :band_id, :place)
	end
end
