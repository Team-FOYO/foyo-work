class OrdersController < ApplicationController
	def new
		@delivery = current_user.deliveries
		@user = current_user
		@order = Order.new
	end

	def confirm
	end

    def create
    end

	def complete
	end

	def show
	end

	def index
	end

	private

	
end
