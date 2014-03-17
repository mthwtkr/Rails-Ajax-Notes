class NotesController < ApplicationController
	 before_action :set_notes, only: [:index, :create, :destroy, :update]

	def index
		@note = Note.new
	end

	def create
		note = Note.create(title: note_params[:title], description: "click to add description")
		respond_to do |format|
			format.js
		end
	end

	def update
		note = Note.find(params[:id])
		note.update_attributes(note_params)

		respond_to do |format|
			if note.update_attributes(note_params)
				format.html { redirect_to notes_path }
				format.json { head :ok }
			else
				format.html { render :action => "index" }
				format.json { render :json => note.errors.full_messages, :status => :unprocessable_entity }
			end
		end
	end

	def destroy
		Note.find(params[:id]).destroy

		respond_to do |format|
			format.js
		end
	end

	private
		def note_params
			params.require(:note).permit(:title, :description)
		end

		def set_notes
			@notes = Note.all
		end
end
