class DeliveriesController < ApplicationController
  #before_action :authenticate_user!

	def index
		@delivery = Delivery.new
		@deliveries  = current_user.deliveries
	end

  	def create
  		@delivery = Delivery.new(delivery_params)
  		@delivery.user_id = current_user.id
    		if @delivery.save
  				redirect_to deliveries_path, notice: "配送先登録が成功しました。"
  			else
  		@deliveries  = current_user.deliveries
  		render 'index'
  		end
  end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
  			if @delivery.update(delivery_params)
  				redirect_to deliveries_path, notice: "配送先情報を変更しました。"
  			else
  		  		render "edit"
  			end
	end

	def destroy
	  	@delivery = Delivery.find(params[:id])
	    @delivery.destroy
	  	redirect_to deliveries_path, notice: "配送先情報を削除しました。"
	end
# private-----------------
	private
  		def delivery_params
  			params.require(:delivery).permit(:postal_code, :address, :addressee)
  		end
# private-----------------
end
