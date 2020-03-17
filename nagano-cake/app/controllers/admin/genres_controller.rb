class Admin::GenresController < ApplicationController
	def index

		@genre = Genre.new
		@genres = Genre.all


	def edit

	end

	def create

		@genre = Genre.new(genre_params)
		# @genre.admin_id = current_user_id
		if @genre.save#, notice : '追加されました'
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)
		end



	end

	def update

	end
	


	private
		def genre_params
			params.require(:genre).permit(:name)
		end

end
