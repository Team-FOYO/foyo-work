class HomesController < ApplicationController
	def top
		@user = current_user
		@genres = Genre.all
		@items = Item.where(is_active: true).order(created_at: :desc)
	end

	def about
	end

	def destroy
	end
end
