class Admin::GenresController < ApplicationController
	def index

		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def create

		@genre = Genre.new(genre_params)
		# @genre.admin_id = current_user_id
		if @genre.save#, notice : '追加されました'
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)#, notice : '追加に失敗しました'
		end
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update#, notice : '更新されました'
			redirect_admin_genres_path
		else
			redirect_back(fallback_location: root_path)#, notice : '更新に失敗しました'
		end
	end



	private
		def genre_params
			params.require(:genre).permit(:name, :is_active)
		end
end
