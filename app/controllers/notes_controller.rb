class NotesController < ApplicationController
	before_action :redirect_to_login
	before_action :note_owner, only: :destroy

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		@note.user_id = current_user.id 
		if @note.save
			redirect_to track_url(@note.track_id)
		else
			flash[:errors] = ["Oh no! Something went wrong"]
			redirect_to track_url(@note.track_id)
		end
	end

	def destroy
		note = Note.find(params[:id])
		note.destroy
		redirect_to track_url(note.track_id)
	end

	private

	def note_owner
		unless current_user.id == self.user_id
			render text: "No way!", status: :forbidden
		end
	end

	def note_params
		params.require(:note).permit(:text, :track_id)
	end
end
